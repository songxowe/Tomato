package com.spring.dao;

import java.io.File;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate4.HibernateCallback;
import org.springframework.orm.hibernate4.support.HibernateDaoSupport;

import com.spring.pojo.VVideo;
import com.spring.util.Filename;
import com.spring.util.Pager;

public class VideoDaoImpl extends HibernateDaoSupport implements VideoDao {

	@Override
	public void add(VVideo video) {
		File file = new File("E:/WorkspaceME 2016 CI/Tomato/WebRoot/video");
		String[] files = file.list(new Filename());
		int i =0;
		for(String s : files){
			i = 0;
			video = new VVideo();
			for(VVideo v : query()){
				if(s.split(".mp4")[0].equals(v.getVideoname())){
					i++;
				}
			}
			if(i == 0){
				video.setVideoname(s.split(".mp4")[0]);
				this.getHibernateTemplate().save(video);
			}
		}
	}

	@Override
	public void remove(VVideo video) {
		this.getHibernateTemplate().delete(video);
	}

	@Override
	public void modify(VVideo video) {
		this.getHibernateTemplate().update(video);
	}

	@Override
	public Pager<VVideo> find(final String videoname,final String filetype,final Integer page,final Integer rows, String sort,
			String order,String show) {
		String temphql = "from VVideo where 1=1 ";
		if (StringUtils.isNotBlank(videoname)) {
			temphql += " and videoname like :videoname ";
		}
		if (StringUtils.isNotBlank(filetype)) {
			temphql += " and filetype like :filetype ";
		}
		if (StringUtils.isNotBlank(show)) {
			temphql += " and isshow=1 ";
		}
		temphql += " order by " + sort + " " + order;
		final String hql = temphql;
		return this.getHibernateTemplate().execute(new HibernateCallback<Pager<VVideo>>() {

			@SuppressWarnings("unchecked")
			@Override
			public Pager<VVideo> doInHibernate(Session session) throws HibernateException {
				Query query = session.createQuery(hql);
				if (StringUtils.isNotBlank(videoname)) {
					query.setString("videoname", "%" + videoname + "%");
				}
				if (StringUtils.isNotBlank(filetype)) {
					query.setString("filetype", "%" + filetype + "%");
				}
				Pager<VVideo> pager = new Pager<VVideo>();
				pager.setTotal(query.list().size());// 查询总记录数

				query.setFirstResult((page - 1) * rows);
				query.setMaxResults(rows);
				
				pager.setRows(query.list());// 分页数据
				return pager;
			}
		});
	}
	@SuppressWarnings("unchecked")
	@Override
	public List<VVideo> query() {
		String hql = "from VVideo ";
		return (List<VVideo>)this.getHibernateTemplate().find(hql, new Object[]{});
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<VVideo> query12() {
		String hql = "from VVideo where isshow=1 ";
		return (List<VVideo>)this.getHibernateTemplate().find(hql, new Object[]{});
	}
}
