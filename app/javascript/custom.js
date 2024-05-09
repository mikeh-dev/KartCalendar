document.addEventListener('turbo:load', () => {
  document.querySelector('.delete-account-button').addEventListener('click', function(e) {
    e.preventDefault();
    if (confirm('Are you sure you want to cancel your account?')) {
      this.closest('form').submit();
    }
  });
});