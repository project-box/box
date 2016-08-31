package net.box.action;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import net.box.db.BoxMusicBean;
import net.box.db.BoxNewmusicDAOImpl;

public class BoxNewmusicAddAction implements Action {
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		BoxNewmusicDAOImpl boxdao = new BoxNewmusicDAOImpl();
		BoxMusicBean Newmusicdata = new BoxMusicBean();
		ActionForward forward = new ActionForward();

		String realFolder = "";
		String saveFolder = "/img";

		int fileSize = 5 * 1024 * 1024;

		realFolder = request.getRealPath(saveFolder);

		boolean result = false;

		try {

			MultipartRequest multi = null;

			multi = new MultipartRequest(request, realFolder, fileSize, "utf-8", new DefaultFileRenamePolicy());

			DateFormat sdFormat = new SimpleDateFormat("MM/dd/yyyy");
			String d = multi.getParameter("publishdate").trim();
			Date pDate = sdFormat.parse(d);

			Newmusicdata.setTitle(multi.getParameter("title").trim());
			Newmusicdata.setArtist(multi.getParameter("artist").trim());
			Newmusicdata.setSimilarity(Integer.parseInt(multi.getParameter("similarity").trim()));
			Newmusicdata.setGenre(multi.getParameter("genre").trim());
			Newmusicdata.setPublishdate(pDate);
			Newmusicdata.setLyrics(multi.getParameter("lyrics").trim());
			Newmusicdata.setAlbum(multi.getParameter("album").trim());
			Newmusicdata.setAlbumcoverfilepath(multi.getFilesystemName((String) multi.getFileNames().nextElement()));

			System.out.println("Title=" + Newmusicdata.getTitle());
			System.out.println("Artist=" + Newmusicdata.getArtist());
			System.out.println("similarity=" + Newmusicdata.getSimilarity());
			System.out.println("Genre=" + Newmusicdata.getGenre());
			System.out.println("Publishdate=" + Newmusicdata.getPublishdate());
			System.out.println("Album=" + Newmusicdata.getAlbum());
			System.out.println("lyrics=" + Newmusicdata.getLyrics());
			System.out.println("Albumcoverfilepath=" + Newmusicdata.getAlbumcoverfilepath());

			/* result = BoxNewmusicDAOImpl.NewmusicInsert(Newmusicdata); */
			boxdao.NewmusicInsert(Newmusicdata);

			/*
			 * if (result == false) { System.out.println("음악 등록 실패"); return
			 * null; } System.out.println("음악 등록 완료");
			 */

			forward.setRedirect(true);
			forward.setPath("./NewMusicList.box");
			return forward;

		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return null;
	}
}