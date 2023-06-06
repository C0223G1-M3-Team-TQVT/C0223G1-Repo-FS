package service.impl;
import model.DetailReceipt;
import repository.IDetailReceiptRepository;
import repository.impl.DetailReceiptRepository;
import service.IDetailReceiptService;
import java.util.List;
import java.util.Map;

public class DetailReceiptService implements IDetailReceiptService {
    private IDetailReceiptRepository iDetailReceiptRepository=new DetailReceiptRepository();


    @Override
    public List<DetailReceipt> getAll() {
        return iDetailReceiptRepository.getAll();
    }

    @Override
    public Map<Integer, Integer> getPriceAll() {
        return iDetailReceiptRepository.getPriceAll();
    }

    @Override
    public List<DetailReceipt> getDetail(int id) {
        return iDetailReceiptRepository.getDetail(id);
    }

    @Override
    public void UpdateCondition(int id) {
       iDetailReceiptRepository.UpdateCondition(id);
    }
}
