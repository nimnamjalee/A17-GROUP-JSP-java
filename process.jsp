<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.Properties" %>
<%@ page import="javax.mail.*" %>
<%@ page import="javax.mail.internet.InternetAddress" %>
<%@ page import="javax.mail.internet.MimeMessage" %>
<%@ page import="com.sun.mail.util.MailSSLSocketFactory" %>

<%
    if ("POST".equalsIgnoreCase(request.getMethod()) && request.getParameter("btn-send") != null) {
        String userName = request.getParameter("UName");
        String email = request.getParameter("Email");
        String subject = request.getParameter("Subject");
        String msg = request.getParameter("msg");
        

        // Check for empty or null values
        if (userName == null || email == null || subject == null || msg == null ||
            userName.trim().isEmpty() || email.trim().isEmpty() || subject.trim().isEmpty() || msg.trim().isEmpty()) {
            response.sendRedirect("index.jsp?error");
            return; // Added to prevent further execution
        }

        String to = "nimkahansi@gmail.com";

        Properties props = new Properties();
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");
        props.put("mail.smtp.auth", "true");
        props.put("mail.debug", "true");
       props.put("mail.smtp.ssl.protocols", "TLSv1.2");

        // Trust all hosts (for debugging purposes)
        MailSSLSocketFactory sf = new MailSSLSocketFactory();
        sf.setTrustAllHosts(true);
        props.put("mail.smtp.ssl.socketFactory", sf);

        Session mailSession = Session.getInstance(props, new Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication("nimkahansi@gmail.com", "brin hbuo qnij kunx");
            }
        });

        try {
            // Create a default MimeMessage object.
            MimeMessage message = new MimeMessage(mailSession);

            // Set From: header field of the header.
            message.setFrom(new InternetAddress("nimkahansi@gmail.com"));

            // Set To: header field of the header.
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));

            // Set Subject: header field
            message.setSubject(subject);

            // Now set the actual message
            message.setText(msg);
            

            // Send message
            Transport.send(message);

            response.sendRedirect("index.jsp?success");
        } catch (MessagingException e) {
            out.println("Message could not be sent. Error: " + e.getMessage());
        }
    } else {
        response.sendRedirect("index.jsp");
    }
%>
