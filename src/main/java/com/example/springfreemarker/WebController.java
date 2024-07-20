package com.example.springfreemarker;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.Arrays;
import java.util.List;

@Controller
public class WebController {

    @Autowired
    private EmailService emailService;

    @GetMapping("/")
    public String index(Model model) {
        model.addAttribute("title", "Spring Boot with FreeMarker and Bootstrap");

        List<Feature> features = Arrays.asList(
                new Feature("Feature 1", "Description for feature 1"),
                new Feature("Feature 2", "Description for feature 2"),
                new Feature("Feature 3", "Description for feature 3")
        );
        model.addAttribute("features", features);

        List<Testimonial> testimonials = Arrays.asList(
                new Testimonial("This is the best app ever!", "John Doe"),
                new Testimonial("I love using this app!", "Jane Smith"),
                new Testimonial("Highly recommend to everyone.", "Jim Brown")
        );
        model.addAttribute("testimonials", testimonials);

        return "index";
    }

    @PostMapping("/contact")
    public String handleContactForm(@RequestParam("name") String name,
                                    @RequestParam("email") String email,
                                    @RequestParam("message") String message,
                                    RedirectAttributes redirectAttributes) {
        // Send email
        emailService.sendSimpleMessage("devwanjala148@gmail.com",email, "New Contact Form Submission",
                "Name: " + name + "\nEmail: " + email + "\nMessage: " + message);

        // Add a success message to the model
        redirectAttributes.addFlashAttribute("successMessage", "Your message has been sent successfully!");

        return "redirect:/";
    }

    public static class Feature {
        private String title;
        private String description;

        public Feature(String title, String description) {
            this.title = title;
            this.description = description;
        }

        public String getTitle() {
            return title;
        }

        public String getDescription() {
            return description;
        }
    }

    public static class Testimonial {
        private String message;
        private String author;

        public Testimonial(String message, String author) {
            this.message = message;
            this.author = author;
        }

        public String getMessage() {
            return message;
        }

        public String getAuthor() {
            return author;
        }
    }
}
