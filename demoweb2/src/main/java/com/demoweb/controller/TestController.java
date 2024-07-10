package com.demoweb.controller;


import com.demoweb.dto.BoardDto;

public class TestController {

    public void doBuilderTest() {
        BoardDto board = new BoardDto.builder().boardNo(1)
                .title("빌더 패턴 연습")
                .writer("olozg")
                .contect("테스트").build();

    }
}
