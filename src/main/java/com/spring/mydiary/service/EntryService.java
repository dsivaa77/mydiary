package com.spring.mydiary.service;

import java.util.List;

import com.spring.mydiary.entity.Entry;

public interface EntryService 
{
	public Entry saveEntry(Entry entry);
	public Entry updateEntry(Entry entry);
	public void deleteEntry(Entry entry);
	public Entry findById(long id);
	public List<Entry> findAll();
	public List<Entry> findByUserId(long id);
}
