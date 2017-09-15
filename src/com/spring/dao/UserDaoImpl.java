package com.spring.dao;

import org.apache.commons.lang.StringUtils;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate4.HibernateCallback;
import org.springframework.orm.hibernate4.support.HibernateDaoSupport;

import com.spring.pojo.VUser;
import com.spring.util.MD5;
import com.spring.util.Pager;

public class UserDaoImpl extends HibernateDaoSupport implements UserDao {

	@Override
	public void add(VUser user) {
		this.getHibernateTemplate().save(user);
	}

	@Override
	public VUser findById(final String username, final String password) {
		final String hql = "from VUser u " + "where u.username=:username and " + "u.password=:password ";
		return this.getHibernateTemplate().execute(new HibernateCallback<VUser>() {
			public VUser doInHibernate(Session session) throws HibernateException {
				Query query = session.createQuery(hql);
				query.setString("username", username);
				query.setString("password", password);
				return (VUser) query.uniqueResult();
			}
		});
	}

	@Override
	public Pager<VUser> find(final String username, final Integer page, final Integer rows, String sort, String order) {
		String temphql = "from VUser where 1=1 ";
		if (StringUtils.isNotBlank(username)) {
			temphql += " and username like :username ";
		}
		temphql += " order by " + sort + " " + order;
		final String hql = temphql;

		return this.getHibernateTemplate().execute(new HibernateCallback<Pager<VUser>>() {

			@SuppressWarnings("unchecked")
			@Override
			public Pager<VUser> doInHibernate(Session session) throws HibernateException {
				Query query = session.createQuery(hql);
				if (StringUtils.isNotBlank(username)) {
					query.setString("username", "%" + username + "%");
				}
				Pager<VUser> pager = new Pager<VUser>();
				pager.setTotal(query.list().size());// 查询总记录数

				query.setFirstResult((page - 1) * rows);
				query.setMaxResults(rows);
				
				pager.setRows(query.list());// 分页数据
				return pager;
			}
		});
	}

	@Override
	public void remove(VUser user) {
		this.getHibernateTemplate().delete(user);
	}

	@Override
	public void modify(VUser user) {
		user.setPassword(MD5.getMD5(user.getPassword()));
		this.getHibernateTemplate().update(user);
	}

}
