package repository;

import model.DetailReceipt;

import java.util.List;
import java.util.Map;

public interface IDetailReceiptRepository {
    List<DetailReceipt> getAll();
    Map<Integer,Integer> getPriceAll();
    List<DetailReceipt> getDetail(int id);
    void UpdateCondition(int id);
}
