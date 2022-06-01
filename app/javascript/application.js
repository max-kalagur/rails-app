// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import jquery from 'jquery'
window.jQuery = jquery
window.$ = jquery

$(function() {

    let sendRating = async function( parentEl, rating ) {
        try {
            const response = await fetch("/api/save-rating.json", {
                method: 'POST',
                body: JSON.stringify( { movie_id: parentEl.data('id'), rating: rating } ),
                headers: {
                    "X-CSRF-Token": document.querySelector("[name='csrf-token']").content,
                    'Content-Type': 'application/json'
                }
            });
            const json = await response.json();
            // console.log('Success:', JSON.stringify(json));
            $('.star-list',parentEl).addClass('d-none');
            $('.movie-rating',parentEl).text( json.movie_avg );
            $('.star',parentEl).text('★').removeClass('d-none');

        } catch (error) {
            // console.error('Error:', error);
            $('.star-list',parentEl).addClass('d-none');
            $('.star',parentEl).removeClass('d-none');
        }
    };
    
    $('.star').on('click', function(e) {

        let el = $(this),
            parent = el.parents('.movie-block'),
            starsList = $('.star-list', parent);
        el.addClass('d-none');
        starsList.removeClass('d-none');
    });

    $('.star-list .star-list-item').on('click', function(e) {

        let el = $(this),
            parent = el.parents('.movie-block');
        sendRating(parent, el.data('i'));
    });



});