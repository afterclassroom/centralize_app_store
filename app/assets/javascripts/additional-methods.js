$(function(){
	if(jQuery.validator.length){
		// Accept a value from a file input based on a required mimetype
		jQuery.validator.addMethod("accept", function(value, element, param) {
			// Split mime on commas in case we have multiple types we can accept
			var typeParam = typeof param === "string" ? param.replace(/\s/g, '').replace(/,/g, '|') : "image/*",
			optionalValue = this.optional(element),
			i, file;

			// Element is optional
			if (optionalValue) {
				return optionalValue;
			}

			if ($(element).attr("type") === "file") {
				// If we are using a wildcard, make it regex friendly
				typeParam = typeParam.replace(/\*/g, ".*");

				// Check if the element has a FileList before checking each file
				if (element.files && element.files.length) {
					for (i = 0; i < element.files.length; i++) {
						file = element.files[i];

						// Grab the mimetype from the loaded file, verify it matches
						if (!file.type.match(new RegExp( ".?(" + typeParam + ")$", "i"))) {
							return false;
						}
					}
				}
			}

			// Either return true because we've validated each file, or because the
			// browser does not support element.files and the FileList feature
			return true;
		}, jQuery.format("Please enter a value with a valid mimetype."));

		//validation: Letters only please
		jQuery.validator.addMethod("lettersonly", function(value, element) {
			return this.optional(element) || /^[a-z]+$/i.test(value);
		}, "Letters only please");

		//validation: No white space please
		jQuery.validator.addMethod("nowhitespace", function(value, element) {
			return this.optional(element) || /^\S+$/i.test(value);
		}, "No white space please");

		//validation : Letters, numbers, and underscores only please
		jQuery.validator.addMethod("alphanumeric", function(value, element) {
			return this.optional(element) || /^\w+$/i.test(value);
		}, "Letters, numbers, and underscores only please");

		jQuery.validator.addMethod("textonly",function(value, element){
			valid = false;
			check = /[^-\.a-zA-Z\s\u00C0-\u00D6\u00D8-\u00F6\u00F8-\u02AE]/.test(value);
			if(check==false)
				valid = true;
			return this.optional(element) || valid;
		},
		jQuery.format("Please only enter letters, spaces, periods, or hyphens.")
		);

		// Older "accept" file extension method. Old docs: http://docs.jquery.com/Plugins/Validation/Methods/accept
		jQuery.validator.addMethod("extension", function(value, element, param) {
			param = typeof param === "string" ? param.replace(/,/g, '|') : "png|jpe?g|gif";
			return this.optional(element) || value.match(new RegExp(".(" + param + ")$", "i"));
		}, jQuery.format("Please enter a value with a valid extension."));

		jQuery.validator.addMethod("money", function(value, element) {
			var isValidMoney = /^\d{0,4}(\.\d{0,2})?$/.test(value);
			return this.optional(element) || isValidMoney;
		}, jQuery.format("Please enter a value with a valid money."));

		jQuery.validator.addMethod("decimalTwo", function(value, element) {
			return this.optional(element) || /^(\d{1,3})(\.\d{1,2})?$/.test(value);
		}, "Must be in US currency format 0.99");

	}
})