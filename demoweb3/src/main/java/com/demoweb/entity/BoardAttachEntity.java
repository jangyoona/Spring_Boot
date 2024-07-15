package com.demoweb.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Entity
@Table(name = "tbl_boardattach")
public class BoardAttachEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int attachNo;
//    @Column(nullable = false) => (단방향 관계) 부모와 연결된 FK 컬럼은 넣지 않아야함. 자동으로 만들어 준다.
//    private int boardNo;
    @Column(nullable = false)
    private String userFileName;	// 사용자가 업로드한 파일 이름
    @Column(nullable = false)
    private String savedFileName;	// 서버에 저장한 파일 이름, 고유한 이름

    @Column @Builder.Default
    private int downloadCount = 0;

    @ManyToOne
    @JoinColumn(name = "boardNo")
    private BoardEntity board;
}
