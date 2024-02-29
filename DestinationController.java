package jp.co.internous.dragon.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import jp.co.internous.dragon.model.domain.MstDestination;
import jp.co.internous.dragon.model.domain.MstUser;
import jp.co.internous.dragon.model.form.DestinationForm;
import jp.co.internous.dragon.model.mapper.MstDestinationMapper;
import jp.co.internous.dragon.model.mapper.MstUserMapper;
import jp.co.internous.dragon.model.session.LoginSession;

/**
 * 宛先情報に関する処理のコントローラー
 * @author インターノウス
 *
 */
@Controller
@RequestMapping("/dragon/destination")
public class DestinationController {

	@Autowired
	private  LoginSession loginSession;

	@Autowired
	private MstDestinationMapper destinationMapper;

	@Autowired
	private MstUserMapper userMapper;

	private Gson gson = new Gson();

	/**
	 * 宛先画面を初期表示する
	 * @param m 画面表示用オブジェクト
	 * @return 宛先画面
	 */
	@RequestMapping("/")
	public String index(Model m) {
		MstUser user = userMapper.findByUserNameAndPassword(loginSession.getUserName(),loginSession.getPassword());

		m.addAttribute("user",user);
		m.addAttribute("loginSession",loginSession);

		return "destination";
	}

	/**
	 * 宛先情報を削除する
	 * @param destinationId 宛先情報ID
	 * @return true:削除成功、false:削除失敗
	 */
	@SuppressWarnings("unchecked")
	@PostMapping("/delete")
	@ResponseBody
	public boolean delete(@RequestBody String destinationId) {

		Map<String, String> map = gson.fromJson(destinationId, Map.class);
		int logicalDeleteCount =destinationMapper.logicalDeleteById(Integer.parseInt(map.get("destinationId")));

		return logicalDeleteCount > 0;
	}

	/**
	 * 宛先情報を登録する
	 * @param f 宛先情報のフォーム
	 * @return 宛先情報id
	 */
	@PostMapping("/register")
	@ResponseBody
	public String register(@RequestBody DestinationForm f) {

		MstDestination destination = new MstDestination(f);
		destination.setUserId(loginSession.getUserId());
		int count = destinationMapper.insert(destination);

		Integer destinationId = count > 0 ? destination.getId() : 0;

		return destinationId.toString();
	}
}
