package service.impl;

import model.Cake;
import model.DetailReceipt;
import model.Receipt;
import repository.IReceiptRepository;
import repository.impl.ReceiptRepository;
import service.IReceiptService;

import java.util.List;

public class ReceiptService implements IReceiptService {
IReceiptRepository receiptRepository = new ReceiptRepository();
    @Override
    public List<Cake> showListCakeOrder() {
        return receiptRepository.showListCakeOrder();
    }

    @Override
    public void addReceipt(List<DetailReceipt> list, Receipt receipt) {
        receiptRepository.addReceipt(list, receipt);
    }
}
