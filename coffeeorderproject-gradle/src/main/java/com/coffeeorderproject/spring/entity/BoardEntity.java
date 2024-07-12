package com.coffeeorderproject.spring.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
@Entity
@Table(name = "board")
public class BoardEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int boardNo;
    @Column(nullable = false)
    private String userId;
    @Column(nullable = false)
    private int boardcategoryId;
    @Column(nullable = false)
    private String boardTitle;
    @Column(nullable = false)
    private String boardContent;

    @Column @Builder.Default
    private Date boardDate = new Date();
    @Column
    private Date boardModifyDate;
    @Column(nullable = false) @Builder.Default
    private boolean boardDelete = false;

//    private ArrayList<BoardCategoryDto> categorys;
//    private List<BoardAttachDto> attachments;
//    private ArrayList<BoardCommentDto> comments;
//    private List<ProductDto> products;
}
