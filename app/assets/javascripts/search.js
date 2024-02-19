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
    
    $("#search-bar").val(suggestionName);
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
  
  $('.recent_search').on('click', function() {
    var query = $(this).find('b').text();
    $('#search-bar').val(query).trigger('input');
  });
  
  $("#search-form").submit(function(e) {
    e.preventDefault(); // Prevent the default form submission

    var query = $("#search-bar").val();
    // debugger;
    searchRestaurants(query); // Call the function to handle the AJAX request
});

  $("#search-restaurants").on('click', function() {
    var query = $("#search-bar").val();
    // debugger;
    searchRestaurants(query); // Call the function to handle the AJAX request
  });

  function searchRestaurants(query) {
    $.ajax({
        url: '/restaurants/search_by',
        type: 'GET',
        dataType: 'html',
        data: {
            search_by: 'Restaurants',
            query: query
        },
        success: function(data) {
            $('#suggestions-container').html(data);
        },
        error: function(xhr, status, error) {
            console.error('AJAX request failed:', status, error);
        }
    });
  }

  $("#search-dishes").on('click',function(){
    var query = $("#search-bar").val();

    $.ajax({
      url: '/restaurants/search_by',
      type: 'GET',
      dataType: 'html',
      data: {
        search_by: 'Dishes',
        query: query

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
