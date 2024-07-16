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
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int commentNo;
//    @Column(nullable = false)
//    private int boardNo; => (단방향 관계) 부모와 연결된 FK 컬럼은 넣지 않아야함. 자동으로 만들어 준다.
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

    @ManyToOne
    @JoinColumn(name = "boardNo")
    private BoardEntity board;
}
