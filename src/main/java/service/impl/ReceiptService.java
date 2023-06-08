package service.impl;

import model.Cake;
import model.DetailReceipt;
import model.Receipt;
import repository.IReceiptRepository;
import repository.impl.ReceiptRepository;
import service.IReceiptService;

import java.util.List;

public class ReceiptService implements IReceiptService {

    private IReceiptRepository receiptRepository = new ReceiptRepository();

    @Override
    public List<Receipt> searchReceipt(String tinhTrang) {

        return receiptRepository.searchReceipt(tinhTrang);
    }

    @Override
    public List<Cake> showListCakeOrder() {
        return receiptRepository.showListCakeOrder();
    }

    @Override
    public List<Receipt> showListReceipt() {
        return receiptRepository.showListReceipt();
    }

    @Override
    public void addReceipt(List<DetailReceipt> list, Receipt receipt) {
        receiptRepository.addReceipt(list, receipt);
    }

    @Override
    public void deleteRecript(int id) {
        receiptRepository.deleteRecript(id);
    }
}
