package com.leoeatle.biology_database;

import java.io.File;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.Iterator;
import java.util.List;

import org.dom4j.*;
import org.dom4j.io.SAXReader;

import com.mysql.jdbc.PreparedStatement;
import com.mysql.jdbc.Statement;

public class InsertDatabase {
	public static void main(String[] args) {
//		creat bioinfo( id varchar(200),initialAmount varchar(200),hasOnlySubstanceUnits varchar(200),name varchar(200),metaid varchar(200),compartment varchar(200));
		String sql1 = "insert into bioinfo(id,initialAmount,hasOnlySubstanceUnits,name,metaid,compartment) values(?,?,?,?,?,?);;";
		String sql2 = "insert into reactions(id,reversible,name,metaid,ListOfReactants,ListOfProducts) values(?,?,?,?,?,?);;";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		PreparedStatement pstmt2 = null;
		try {
			conn = ConnectionUtils.getConnection();
			pstmt = (PreparedStatement) conn.prepareStatement(sql1);
			pstmt2 = (PreparedStatement) conn.prepareStatement(sql2);
			System.out.println("----check connect£¡----");
			SAXReader reader = new SAXReader();
			Document document = reader.read(new File("src/bioinfo.xml"));
			//»ñÈ¡¸ù½Úµã
			Element node = document.getRootElement();
			
			Element model_node = node.element("model");
			Element listOfSpecies = model_node.element("listOfSpecies");
			List<Element> species = listOfSpecies.elements("species");
			for(Element s : species)
			{
				Attribute id = s.attribute("id");
				System.out.println(id.getText());
				Attribute initialAmount = s.attribute("initialAmount");
				Attribute hasOnlySubstanceUnits = s.attribute("hasOnlySubstanceUnits");
				Attribute name = s.attribute("name");
				Attribute metaid = s.attribute("metaid");
				Attribute compartment = s.attribute("compartment");
				pstmt.setString(1, id.getText());
				pstmt.setString(2, initialAmount.getText());
				pstmt.setString(3, hasOnlySubstanceUnits.getText());
				pstmt.setString(4, name.getText());
				pstmt.setString(5, metaid.getText());
				pstmt.setString(6, compartment.getText());
				pstmt.addBatch();
			}
			//pstmt.executeBatch();
			System.out.println("species导入完成");
			
			Element listOfReactions = model_node.element("listOfReactions");
			List<Element> reactions = listOfReactions.elements("reaction");
			for(Element r : reactions)
			{
				Attribute id = r.attribute("id");
				System.out.println(id.getText());
				Attribute reversible = r.attribute("reversible");
				//Attribute hasOnlySubstanceUnits = r.attribute("hasOnlySubstanceUnits");
				Attribute name = r.attribute("name");
				Attribute metaid = r.attribute("metaid");
				//Attribute compartment = r.attribute("compartment");
				List<Element> reactants = r.element("listOfReactants").elements("speciesReference");//获取反应物
				String reactants_str = "";
				for(Element reactant :reactants )
				{
					Attribute reactant_species = reactant.attribute("species");
					reactants_str = reactants_str + ", " + reactant_species.getText();
				}
				//获取生成物
				Element products = r.element("listOfProducts").element("speciesReference");
				Attribute products_species = products.attribute("species");
				pstmt2.setString(1, id.getText());
				pstmt2.setString(2, reversible.getText());
				pstmt2.setString(3, name.getText());
				pstmt2.setString(4, metaid.getText());
				pstmt2.setString(5, reactants_str);
				pstmt2.setString(6, products_species.getText());
				pstmt2.addBatch();
				
				
			}
			pstmt2.executeBatch();
			System.out.println("reactions导入完成");
			

		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			ConnectionUtils.close(pstmt);
			ConnectionUtils.close(conn);
		}
	}
}
