package service;

import model.DetailReceipt;

import java.util.List;
import java.util.Map;

public interface IDetailReceiptService {
    Map<Integer,Integer> getMoney();
    List<DetailReceipt> getAll();
    Map<Integer,Integer> getPriceAll();
    List<DetailReceipt> getDetail(int id);
    void UpdateCondition(int id);
}
