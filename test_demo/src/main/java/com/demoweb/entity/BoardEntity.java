package com.demoweb.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;
import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Entity
@Table(name = "tbl_board")
public class BoardEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY) // 자동증가 컬럼인 경우 명시해야함
    private Integer boardNo;
    @Column(nullable = false) // not null
    private String title;
    @Column(nullable = false, length = 1000)
    private String content;
    @Column(nullable = false)
    private String writer;

    @Builder.Default @Column
    private Date writeDate = new Date();
    @Builder.Default @Column
    private Date modifyDate = new Date();
    @Builder.Default @Column
    private int readCount = 0;
    @Builder.Default @Column
    private boolean deleted = false;

    // mappedBy? (양방향 관계)에서만 사용하는 속성 // 부모 클래스에서 명시.
    // fetch? 부모데이터 가져올 때 자식도 바로 가져올거니?
    // cascade? 부모데이터에 변경사항이 있을 때 자식에도 반영할거니?
    @OneToMany(mappedBy = "board", fetch = FetchType.EAGER, cascade = CascadeType.ALL) // LAZW?
    // @JoinColumn(name = "boardNo") => 양방향 관계는 자식쪽에서 Join걸면됨
    private List<BoardAttachEntity> attachments;

    @OneToMany(mappedBy = "board", fetch = FetchType.EAGER, cascade = CascadeType.ALL)
//  @JoinColumn(name = "boardNo")
    private List<BoardCommentEntity> comments;

}


