const stars = document.querySelectorAll('.star');
const reviewText = document.getElementById('review-text');
const submitButton = document.getElementById('submit-button');
const reviewOutput = document.getElementById('review-output');
const movieTitle = document.getElementById('movie-title');
const moviePoster = document.getElementById('movie-poster');

let selectedRating = 0;

stars.forEach(star => {
    star.addEventListener('click', () => {
        selectedRating = parseInt(star.getAttribute('data-value'));
        highlightStars(selectedRating);
    });
});

function highlightStars(rating) {
    stars.forEach(star => {
        if (parseInt(star.getAttribute('data-value')) <= rating) {
            star.style.color = 'gold';
        } else {
            star.style.color = 'black';
        }
    });
}

submitButton.addEventListener('click', () => {
    const review = reviewText.value;
    if (review && selectedRating > 0) {
        const reviewResult = `You Give Feedback on: "${movieTitle.innerText}" with ${selectedRating} stars.
         Your Feedback: "${review}"`;
        reviewOutput.innerText = reviewResult;
    } else {
        reviewOutput.innerText = 'Please provide both review and rating before submitting.';
    }
});
