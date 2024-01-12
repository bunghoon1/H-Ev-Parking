package com.example.demo.controller;
import org.springframework.boot.web.servlet.error.ErrorController;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class CustomErrorController implements ErrorController {

    @GetMapping("/error")
    public String handleError() {
        // 여기서 커스텀 에러 페이지를 반환하도록 로직을 작성합니다.
        return "login"; // 에러 페이지의 뷰 이름을 반환합니다.
    }

    public String getErrorPath() {
        return "/error";
    }
}