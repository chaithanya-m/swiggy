// app/assets/javascripts/suggestions.js

$(document).on('turbolinks:load', function() {
  $('#search-bar').on('input', function() {
    var query = $(this).val();

    if (query.trim() === '') {
      clearSuggestions();
      return;
    }
    
    $.ajax({
      url: '/suggestions',
      type: 'GET',
      dataType: 'json',
      data: { query: query },
      success: function(data) {
        displaySuggestions(data);
      }
    });
  });

  function displaySuggestions(suggestions) {
    var suggestionsContainer = $('#suggestions-container');
    suggestionsContainer.empty();
    if (suggestions.length > 0) {
      suggestions.forEach(function(suggestion) {
        var nameHtml = '<h4>' + suggestion.name + '</h4>';
        var tableHtml = suggestion.table_name ? '<p>' + suggestion.table_name.toLowerCase() + '</p>' : '';
        var suggestionHtml = '<div>' + nameHtml + tableHtml + '</div>';
        suggestionsContainer.append(suggestionHtml);
      });
    } else {
      suggestionsContainer.append('<div>No suggestions found</div>');
    }
  }
 
});
