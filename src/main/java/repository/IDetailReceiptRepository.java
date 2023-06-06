package repository;

import model.DetailReceipt;

import java.util.List;
import java.util.Map;

public interface IDetailReceiptRepository {
    List<DetailReceipt> getAll();
    Map<Integer,Integer> getPriceAll();
}
