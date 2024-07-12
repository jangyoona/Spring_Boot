package com.demoweb.repository;

import com.demoweb.entity.BoardAttachEntity;
import com.demoweb.entity.BoardEntity;
import jakarta.transaction.Transactional;
import org.apache.ibatis.annotations.Param;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

public interface BoardRepository extends JpaRepository<BoardEntity, Integer> {

//    @Query(value = "SELECT attachNo, userFileName, savedFileName, downloadCount " +
//            "FROM tbl_boardattach " +
//            "WHERE attachno = :attachNo",
//            nativeQuery = true) // 실제 데이터 베이스의 구문 규칙에 따라 작성한 SQL 이란 뜻임.
    @Query(value = "SELECT ba FROM BoardAttachEntity ba WHERE ba.attachNo = :attachNo") // JPQL이라고 부름 => JPA 쿼리랭귀지
    BoardAttachEntity findBoardAttachByAttachNo(@Param("attachNo") int attachNo);

    // 수정할 때는 modifying이랑, Transactional 넣어야함.
    @Modifying
    @Transactional
    @Query(value = "DELETE FROM BoardAttachEntity ba WHERE ba.attachNo = :attachNo")
    void deleteBoardAttachByAttachNo(@Param("attachNo") int attachNo);


    @Modifying
    @Transactional
    @Query(value = "INSERT INTO tbl_boardattach(boardNo, userFileName, savedFileName, downloadCount)" +
                  "VALUES(?, ?, ?, 0)", nativeQuery = true)
    void insertBoardAttach(@Param("boardNo") int boardNo, @Param("userFileName") String userFileName, @Param("savedFileName") String savedFileName);
}
