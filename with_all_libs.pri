
INCLUDEPATH += $$RBA_INC $$PYA_INC $$TL_INC $$GSI_INC $$DB_INC $$RDB_INC $$LYM_INC $$LAYBASIC_INC $$LAY_INC $$ANT_INC $$IMG_INC $$EDT_INC $$LIB_INC $$VERSION_INC
DEPENDPATH += $$RBA_INC $$PYA_INC $$TL_INC $$GSI_INC $$DB_INC $$RDB_INC $$LYM_INC $$LAYBASIC_INC $$LAY_INC $$ANT_INC $$IMG_INC $$EDT_INC $$LIB_INC $$VERSION_INC

LIBS += "$$PYTHONLIBFILE" "$$RUBYLIBFILE" -L$$DESTDIR -lsunano_tl -lsunano_gsi -lsunano_db -lsunano_rdb -lsunano_lib

!equals(HAVE_QT, "0") {

  INCLUDEPATH += $$LYM_INC $$LAYBASIC_INC $$LAY_INC $$ANT_INC $$IMG_INC $$EDT_INC
  DEPENDPATH += $$LYM_INC $$LAYBASIC_INC $$LAY_INC $$ANT_INC $$IMG_INC $$EDT_INC

  LIBS += -L$$DESTDIR -lsunano_lym -lsunano_laybasic -lsunano_lay -lsunano_ant -lsunano_img -lsunano_edt

  # Note: this accounts for UI-generated headers placed into the output folders in
  # shadow builds:
  INCLUDEPATH += $$DESTDIR/laybasic $$DESTDIR/lay $$DESTDIR/ext
  DEPENDPATH += $$DESTDIR/laybasic $$DESTDIR/lay $$DESTDIR/ext

  equals(HAVE_QTBINDINGS, "1") {
    LIBS += -lsunano_qtbasic -lsunano_QtGui -lsunano_QtCore
  }

}

equals(HAVE_RUBY, "1") {
  LIBS += -lsunano_rba
} else {
  LIBS += -lsunano_rbastub
}

equals(HAVE_PYTHON, "1") {
  LIBS += -lsunano_pya
} else {
  LIBS += -lsunano_pyastub
}

!equals(HAVE_QT, "0") {
  equals(HAVE_RUBY, "1") {
    # DRC is only available with Ruby
    INCLUDEPATH += $$DRC_INC $$LVS_INC
    DEPENDPATH += $$DRC_INC $$LVS_INC
    LIBS += -lsunano_drc -lsunano_lvs
  }
}

msvc {
  LIBS += user32.lib
}
