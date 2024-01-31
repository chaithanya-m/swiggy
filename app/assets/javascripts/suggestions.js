$(document).ready(function() {
  // Store the initial content of the suggestions container
  var suggestionsContainer = $('#suggestions-container');
  var htmlContent = suggestionsContainer.html();

  $('#search-bar').on('input', function() {
    var query = $(this).val();

    if (query.trim() === '') {
      $('#suggestions-container').html(htmlContent);
      return;
    }

    $.ajax({
      url: '/restaurants/suggestions',
      type: 'GET',
      dataType: 'html',
      data: { query: query },
      success: function(data) {
        $('#suggestions-container').html(data);
      },
      error: function(xhr, status, error) {
        console.error('AJAX request failed:', status, error);
      }
    });
  });

  $('#suggestions-container').on('click', '.suggestion', function() {
    var suggestionId = $(this).data('id');
    var suggestionName = $(this).find('b').text();
    var suggestionTableName = $(this).find('small').text();
    var endpoint = suggestionTableName === 'restaurant' ? '/restaurants/search_by_restaurents' : '/restaurants/search_by_dish';
  
    $.ajax({
      url: endpoint,
      type: 'GET',
      dataType: 'html',
      data: {
        suggestionId: suggestionId
      },
      success: function(data) {
        $('#suggestions-container').html(data);
      },
      error: function(xhr, status, error) {
        console.error('AJAX request failed:', status, error);
      }
    });
  });
  
});
