package br.com.fatecpg.bd;
import java.util.ArrayList;
public class Bd {
    private static ArrayList<Contato> contatosList = new ArrayList<>();

    public static ArrayList<Contato> getContatosList() {
        return contatosList;
    }
    
}
