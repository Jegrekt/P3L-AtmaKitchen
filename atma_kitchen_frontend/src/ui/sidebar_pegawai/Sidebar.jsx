//@ts-nocheck
import { useState } from "react";
import { Card, List } from "@material-tailwind/react";

import Logo from "../../assets/images/Logo.png";
import { Outlet, useLocation } from "react-router-dom";
import Header from "./Header";
import SidebarItem from "./SidebarItem";
import {
  FaAward,
  FaBowlFood,
  FaCakeCandles,
  FaCartShopping,
  FaChartColumn,
  FaGears,
  FaPeopleCarryBox,
  FaPeopleGroup,
  FaUser,
} from "react-icons/fa6";
import { FaCheckCircle, FaMoneyBill } from "react-icons/fa";
import { BiSolidNotepad } from "react-icons/bi";
import { MdDeliveryDining } from "react-icons/md";

const roleItem = {
  adm: [
    {
      to: "produk",
      name: "Produk",
      icon: <FaCakeCandles />,
    },
    {
      to: "bahan-baku",
      name: "Bahan Baku",
      icon: <FaBowlFood />,
    },
    {
      to: "data-customer",
      name: "Data Customer",
      icon: <FaUser />,
    },
    {
      to: "pengiriman-admin",
      name: "Pengiriman",
      icon: <MdDeliveryDining />,
    },
    {
      to: "pending-pembayaran",
      name: "Pending Pembayaran",
      icon: <FaMoneyBill />,
    },
    {
      to: "konfirmasi-saldo",
      name: "Konfirmasi Penarikan",
      icon: <FaMoneyBill />,
    },
    {
      to: "konfirmasi-siap",
      name: "Konfirmasi Siap",
      icon: <FaCheckCircle />,
    },
    {
      to: "konfirmasi-akhir",
      name: "Konfirmasi Akhir",
      icon: <FaCheckCircle />,
    },
    {
      to: "sistem-batal",
      name: "Sistem Batal",
      icon: <FaGears />,
    },
  ],
  mo: [
    {
      to: "karyawan",
      name: "Karyawan",
      icon: <FaPeopleGroup />,
    },
    {
      to: "penitip",
      name: "Penitip",
      icon: <FaPeopleCarryBox />,
    },
    {
      to: "pembelian-bahan-baku",
      name: "Pembelian Bahan Baku",
      icon: <FaCartShopping />,
    },
    {
      to: "pengeluaran-lain",
      name: "Pengeluaran Lain",
      icon: <BiSolidNotepad />,
    },
    {
      to: "Konfirmasi-mo",
      name: "Konfirmasi Pesanan",
      icon: <FaCheckCircle />,
    },
    {
      to: "konfirmasi-proses",
      name: "Konfirmasi Pemrosesan",
      icon: <FaCheckCircle />,
    },
    {
      to: "laporan",
      name: "Laporan",
      icon: <FaChartColumn />,
    },
  ],
  own: [
    {
      to: "gaji",
      name: "Gaji & Bonus",
      icon: <FaAward />,
    },
    {
      to: "laporan",
      name: "Laporan",
      icon: <FaChartColumn />,
    },
  ],
};

function Sidebar() {
  const [showSidebar, setShowSidebar] = useState(false);
  const location = useLocation();
  const { pathname } = location;
  const role = JSON.parse(localStorage.getItem("user")).role;

  return (
    <div className="flex w-full ">
      <Card
        className={`absolute left-0 top-0 z-[9999] flex h-screen p-4  rounded-none  transition-all duration-300 lg:static lg:translate-x-0 ${
          showSidebar ? "translate-x-0" : "-translate-x-full"
        }`}
      >
        <button
          onClick={() => setShowSidebar(!showSidebar)}
          className="block lg:hidden absolute right-4 top-4"
        >
          <i className="fa-solid fa-times text-2xl"></i>
        </button>
        <div className="mb-2 flex items-center gap-4 pt-4 p-4 justify-center">
          <img src={Logo} alt="brand" className="h-20" />
        </div>
        <hr className="border-b-[1px] border-pink-secondary mx-4" />
        <List>
          {roleItem[role].map((item, index) => (
            <SidebarItem
              key={index}
              pathname={pathname}
              to={item.to}
              name={item.name}
              icon={item.icon}
            >
              {item.icon}
            </SidebarItem>
          ))}
        </List>
      </Card>
      <div className="flex flex-col relative flex-1 overflow-y-auto overflow-x-hidden h-screen print:h-auto bg-slate-50 ">
        <Header sidebarOpen={showSidebar} setSidebarOpen={setShowSidebar} />
        <div className="w-full px-12">
          <div className="py-12 max-w-7xl mx-auto">
            <Outlet />
          </div>
        </div>
      </div>
    </div>
  );
}

export default Sidebar;
