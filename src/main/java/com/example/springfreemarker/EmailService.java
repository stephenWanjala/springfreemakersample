package com.example.springfreemarker;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

@Service
public class EmailService {

    private final JavaMailSender emailSender;

    @Autowired
    public EmailService(JavaMailSender emailSender) {
        this.emailSender = emailSender;
    }

    public void sendSimpleMessage(String to,String from, String subject, String text) {
        SimpleMailMessage message = new SimpleMailMessage();
       message.setTo(to);
        message.setFrom(from);
        message.setSubject(subject);
        message.setText(text);
        emailSender.send(message);
    }
}

