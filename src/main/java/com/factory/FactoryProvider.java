package com.factory;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class FactoryProvider {

	public static SessionFactory factory;
	
//we dont want to create object of FactoryProvider so,we will make the method static
//We cant call non static method directly in static method so,we will make the variable also static
	
	
	public static SessionFactory getFactory()
	{
		if(factory==null)
		{
			factory=new Configuration().configure().buildSessionFactory();
		}
		return factory;
	}
	
	public void closeFactory()
	{
		if(factory.isOpen())
		{
			factory.close();
		}
	}
}
