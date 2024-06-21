/* eslint-disable react/prop-types */
import { Link, Outlet } from "react-router-dom";
import ProfilCustomer from "./ProfilCustomer";
import { useState } from "react";
import Logo from "../../assets/images/Logo.png";
import { FaAlignJustify } from "react-icons/fa6";

function HeaderCustomer() {
  const [isMobileMenuOpen, setIsMobileMenuOpen] = useState(false);
  const navbar = [
    {
      name: "Pemesanan",
      href: "/pemesanan",
    },
    {
      name: "Pending Pembayaran",
      href: "/pending-pembayaran-customer",
    },
    {
      name: "Konfirmasi Pemesanan",
      href: "konfirmasi-customer",
    },
  ];
  return (
    <>
      <div className="bg-slate-50">
        <nav className="relative bg-white border shadow-md print:hidden">
          <div
            id="navbar-menu"
            className="container m-auto flex justify-between items-center mx-auto font-semibold text-lg py-2"
          >
            <div className="flex gap-4">
              <Link to="#">
                <img src={Logo} alt="" className="w-16" />
              </Link>
              <ul className="hidden lg:flex gap-4 items-center text-base font-semibold">
                {navbar.map((item) => (
                  <li className="hover:underline">
                    <Link to={item.href}>{item.name}</Link>
                  </li>
                ))}
              </ul>
            </div>
            <div className=" flex-grow items-center justify-between px-4 py-4 shadow-2 md:px-6 2xl:px-11 hidden lg:flex">
              <div className="flex items-center gap-3 2xsm:gap-7"></div>
              <ProfilCustomer />
            </div>

            <button
              className="lg:hidden flex flex-col justify-evenly  w-8 h-8 rounded items-center"
              onClick={() => setIsMobileMenuOpen((previous) => !previous)}
            >
              <FaAlignJustify />
            </button>
          </div>
          {isMobileMenuOpen && (
            <div
              id="mobile-menu"
              className="flex flex-col lg:hidden absolute top-100 bg-white text-slate-900 min-h-screen min-w-full items-center text-lg font-semibold gap-4"
            >
              {navbar.map((item) => (
                <a href={item.href} className="text-sm">
                  {item.name}
                </a>
              ))}
              <ProfilCustomer />
            </div>
          )}
        </nav>

        <div className="py-12 container m-auto">
          <Outlet />
        </div>
      </div>
    </>
  );
}

export default HeaderCustomer;
