package ru.shemich.bonusservice.service;

import ru.shemich.bonusservice.api.response.enums.OperationType;
import ru.shemich.bonusservice.model.Privilege;
import ru.shemich.bonusservice.model.PrivilegeHistory;

import java.util.List;

public interface PrivilegeHistoryService {

    List<PrivilegeHistory> getListByPrivilegeId(Long privilegeId);


    void create(Privilege privilege, String ticketUid, Integer balance, OperationType operationType);
}
