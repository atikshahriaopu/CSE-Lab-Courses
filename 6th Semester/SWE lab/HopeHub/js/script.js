document.addEventListener('DOMContentLoaded', function() {
    // Smooth scrolling for anchor links
    document.querySelectorAll('a[href^="#"]').forEach(anchor => {
        anchor.addEventListener('click', function(e) {
            e.preventDefault();
            
            const targetId = this.getAttribute('href');
            if (targetId === '#') return;
            
            const targetElement = document.querySelector(targetId);
            if (targetElement) {
                targetElement.scrollIntoView({
                    behavior: 'smooth'
                });
            }
        });
    });
    
    // Initialize tooltips
    const tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'));
    tooltipTriggerList.map(function (tooltipTriggerEl) {
        return new bootstrap.Tooltip(tooltipTriggerEl);
    });
    
    // Initialize popovers
    const popoverTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="popover"]'));
    popoverTriggerList.map(function (popoverTriggerEl) {
        return new bootstrap.Popover(popoverTriggerEl);
    });
    
    // Form validation
    const forms = document.querySelectorAll('.needs-validation');
    Array.prototype.slice.call(forms).forEach(function(form) {
        form.addEventListener('submit', function(event) {
            if (!form.checkValidity()) {
                event.preventDefault();
                event.stopPropagation();
            }
            form.classList.add('was-validated');
        }, false);
    });
    
    // Mission join buttons
    document.querySelectorAll('.join-mission').forEach(button => {
        button.addEventListener('click', function() {
            const mission = this.closest('tr').querySelector('td:first-child').textContent;
            alert(`You have joined the mission: ${mission}`);
        });
    });
    
    // Emergency alert response
    document.querySelectorAll('.respond-alert').forEach(button => {
        button.addEventListener('click', function() {
            const alert = this.closest('.alert').querySelector('.alert-heading').textContent;
            alert(`You are responding to: ${alert}`);
        });
    });
    
    // Simulate loading for dashboard stats
    if (document.querySelector('.dashboard-stats')) {
        const stats = document.querySelectorAll('.dashboard-stats h3');
        stats.forEach(stat => {
            const target = +stat.textContent;
            let count = 0;
            const duration = 2000;
            const increment = target / (duration / 16);
            
            const updateCount = () => {
                count += increment;
                if (count < target) {
                    stat.textContent = Math.floor(count);
                    requestAnimationFrame(updateCount);
                } else {
                    stat.textContent = target;
                }
            };
            
            updateCount();
        });
    }
});
