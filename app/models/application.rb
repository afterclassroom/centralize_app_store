class Application < ActiveRecord::Base
	include RailsSettings::Extend

	validates :name, uniqueness: true
	validates :app_key, :uniqueness => true

	belongs_to :user
	has_many :app_notifications, :dependent => :destroy
	has_many :app_categories, :dependent => :destroy

	def self.generate_unique_app_key(app_key = SecureRandom.hex(16))
		client_app = where(:app_key => app_key)
		return app_key if client_app.blank?
		generate_unique_app_key
	end

	def make_icon(at_file)
		self.settings.icon = {
			url: at_file.file.url,
			name: at_file.read_attribute(:file_file_name),
			size: at_file.read_attribute(:file_file_size)
		}
		self.save
	end

	def make_slide(link, type, image='')
		attach_files ||= {}
		attach_files = self.settings.slides
		attach_files[link] = {
			type: type,
			image: image
		}
		self.settings.slides = attach_files
		self.save
	end

	def get_slide
		files = []
		attach_files = self.settings.slides
		if attach_files
			attach_files.each_with_index do |attachment, i|
				files << {"url" => attach_files.keys[i], "type" => attach_files.values[i][:type], "image" => attach_files.values[i][:image]}
			end
		end

		return files
	end
end
