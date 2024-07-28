document.addEventListener("turbolinks:load", function() {
    // Add question
    var addQuestionLink = document.getElementById('add-question');
    var questionFieldsTemplate = document.querySelector('.question-fields').cloneNode(true);
    addQuestionLink.addEventListener('click', function(e) {
        e.preventDefault();
        var newFields = questionFieldsTemplate.cloneNode(true);
        newFields.querySelectorAll('input[type="text"]').forEach(input => input.value = '');
        addQuestionLink.insertAdjacentElement('beforebegin', newFields);
    });

    // Remove fields
    document.addEventListener('click', function(e) {
        if (e.target && e.target.matches('.remove_fields')) {
            e.preventDefault();
            e.target.closest('.question-fields').remove();
        }
    });

    // Add option
    document.addEventListener('click', function(e) {
        if (e.target && e.target.matches('.add_option_fields')) {
            e.preventDefault();
            var questionFields = e.target.closest('.question-fields');
            var optionFieldsTemplate = questionFields.querySelector('.option-fields').cloneNode(true);
            optionFieldsTemplate.querySelectorAll('input[type="text"]').forEach(input => input.value = '');
            e.target.insertAdjacentElement('beforebegin', optionFieldsTemplate);
        }
    });
});
