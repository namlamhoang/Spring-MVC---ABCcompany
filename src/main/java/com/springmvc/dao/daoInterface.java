package com.springmvc.dao;

import java.util.List;

public interface daoInterface<Entity> {
	
	public List<Entity> getList();
	public List<Entity> searchList(Entity e);
	public List<Entity> searchListById(String id);
	public Entity getEntity(Entity e);
	public Entity getEntityById(int id);
	public void save(Entity e);
	public void update(Entity e);
	public void delete(Entity e);
	
}
