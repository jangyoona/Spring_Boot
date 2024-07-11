package com.demoweb.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Entity
@Table(name = "tbl_boardcomment")
public class BoardCommentEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int commentNo;
    @Column(nullable = false)
    private int boardNo;
    @Column(nullable = false, length = 500)
    private String content;
    @Column(nullable = false)
    private String writer;

    @Column @Builder.Default
    private Date writeDate = new Date();
    @Column @Builder.Default
    private Date modifyDate = new Date();
    @Column @Builder.Default
    private boolean deleted = false;

    @Column
    private int groupNo;
    @Column(nullable = false)
    private int step;
    @Column(nullable = false)
    private int depth;
}
