package view;

import java.awt.*;
import java.awt.event.*;
import javax.swing.*;
import controle.*;

public class TelaMenu implements ActionListener {
	
	private static JFrame janela = new JFrame("Controle de Curso");
	private static JLabel titulo = new JLabel("Menu Principal");
	private static JButton aluno = new JButton("Aluno");
	private static JButton curso = new JButton("Curso");
	private static JButton prof = new JButton("Professor");
	public static ControleDados dados = new ControleDados();
	
	public TelaMenu() {
		titulo.setFont(new Font("Arial", Font.BOLD, 20));
		titulo.setBounds(120, 10, 150, 30);
		curso.setBounds(140, 100, 100, 30);
		prof.setBounds(140, 150, 100, 30);
		aluno.setBounds(140, 50, 100, 30);
		
		janela.setLayout(null);
		
		janela.add(titulo);
		janela.add(aluno);
		janela.add(curso);
		janela.add(prof);
		
		janela.setSize(400, 250);
		janela.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		janela.setVisible(true);
	}
	
	public static void main(String[] args) {
		TelaMenu menu = new TelaMenu();
		
		aluno.addActionListener(menu);
		prof.addActionListener(menu);
		curso.addActionListener(menu);
	}
	
	public void actionPerformed(ActionEvent e) {
		Object src = e.getSource();
		
		if(src == aluno)
			new TelaPessoa().mostrarDados(dados, 1);
		
		if(src == prof)
			new TelaPessoa().mostrarDados(dados, 2);
		
		if(src == curso)
			JOptionPane.showMessageDialog(null, 
					"Ainda precisam ser implementadas as funcionalidades\n"
					+ "relacionadas a curso e a matrícula", null, 
					JOptionPane.INFORMATION_MESSAGE);
	}
}
