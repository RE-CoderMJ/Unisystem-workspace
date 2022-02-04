package com.us.uni.board.model.service;

import java.util.ArrayList;

import com.us.uni.board.model.vo.Board;
import com.us.uni.board.model.vo.Reply;
import com.us.uni.common.model.vo.PageInfo;


public interface BoardService {
		
		//Ŀ�´�Ƽ �Խ���
	
		// 1. �Խ���(Ŀ�´�Ƽ) ����Ʈ ������ ���� (����¡)
		int selectListCount();
		ArrayList<Board> selectList(PageInfo pi);
		
		// 2. �Խñ�(Ŀ�´�Ƽ) �ۼ��ϱ� ����
		int insertBoard(Board b);
		
		// 3. �Խñ�(Ŀ�´�Ƽ) ����ȸ�� ����
		int increaseCount(int boardNo);
		Board selectBoard(int boardNo);
		
		// 4. �Խñ�(Ŀ�´�Ƽ) ������ ����
		int deleteBoard(int boardNo);
		
		// 5. �Խñ�(Ŀ�´�Ƽ) ������ ����
		int updateBoard(Board b);
		
		// 6. ���(Ŀ�´�Ƽ) ����Ʈ ��ȸ�� ���� (ajax)
		ArrayList<Reply> selectReplyList(int boardNo);
		
		// 7. ���(Ŀ�´�Ƽ) �ۼ��� ���� (ajax)
		int insertReply(Reply r);
		
		// �������� �Խ���
		
		// 1. ���� ����Ʈ ������ ���� (����¡)
		int selectnListCount();
		ArrayList<Board> selectnList(PageInfo pi);
		
		// 2. ���� �ۼ��ϱ� ����
		int insertnBoard(Board b);
		
		// 3. ��������ȸ�� ����
		int increasenCount(int boardNo);
		Board selectnBoard(int boardNo);
		
		// 4. ���� ������ ����
		int deletenBoard(int boardNo);
		
		// 5. ���� ���� ����
		int updatenBoard(Board b);
		
		// 6. ���� ����Ʈ ��ȸ�� ���� (ajax)
		ArrayList<Reply> selectnReplyList(int boardNo);
		
		// ���Ȱ�� �Խ���
		
		// 1. ���Ȱ�� ����Ʈ ������ ���� (����¡)
		int selectcListCount();
		ArrayList<Board> selectcList(PageInfo pi);
				
		// 2. ���Ȱ�� �ۼ��ϱ� ����
		int insertcBoard(Board b);
				
		// 3. ���Ȱ�� ����ȸ�� ����
		int increasecCount(int boardNo);
		Board selectcBoard(int boardNo);
				
		// 4. ���Ȱ�� ������ ����
		int deletecBoard(int boardNo);
				
		// 5. ���Ȱ�� ������ ����
		int updatecBoard(Board b);
				
		// 6. ���Ȱ�� ����Ʈ ��ȸ�� ���� (ajax)
		ArrayList<Reply> selectcReplyList(int boardNo);
				
		// 7. ���Ȱ�� �ۼ��� ���� (ajax)
		int insertcReply(Reply r);
		
		// ���Ƹ� �Խ���
		
		// 1. ���Ƹ� ����Ʈ ������ ���� (����¡)
		int selectvListCount();
		ArrayList<Board> selectvList(PageInfo pi);
						
		// 2. ���Ƹ� �ۼ��ϱ� ����
		int insertvBoard(Board b);
						
		// 3. ���Ƹ� ����ȸ�� ����
		int increasevCount(int boardNo);
		Board selectvBoard(int boardNo);
						
		// 4. ���Ƹ� ������ ����
		int deletevBoard(int boardNo);
						
		// 5. ���Ƹ� ������ ����
		int updatevBoard(Board b);
						
		// 6. ���Ƹ� ����Ʈ ��ȸ�� ���� (ajax)
		ArrayList<Reply> selectvReplyList(int boardNo);
						
		// 7. ���Ƹ� �ۼ��� ���� (ajax)
		int insertvReply(Reply r);		
		
}
