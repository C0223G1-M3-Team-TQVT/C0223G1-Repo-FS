package repository;

import model.DetailReceipt;

import java.util.List;
import java.util.Map;

public interface IDetailReceiptRepository {
    Map<Integer, Integer> getMoney();

    List<DetailReceipt> getAll();

    Map<Integer, Integer> getPriceAll();

    List<DetailReceipt> getDetail(int id);

    boolean UpdateCondition(int id);

}
