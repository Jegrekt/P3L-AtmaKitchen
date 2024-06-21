/* eslint-disable react/prop-types */
import Profile from "./Profile";

function Header({ sidebarOpen, setSidebarOpen }) {
  return (
    <header className="sticky top-0 z-[999] flex w-full bg-white shadow-sm print:hidden">
      <button>
        <i
          onClick={() => setSidebarOpen(!sidebarOpen)}
          className="fa-solid fa-bars text-2xl p-4 lg:hidden text-gray-700"
        ></i>
      </button>
      <div className="flex flex-grow items-center justify-between px-4 py-4 shadow-2 md:px-6 2xl:px-11">
        <div className="flex items-center gap-3 2xsm:gap-7"></div>
        <Profile />
      </div>
    </header>
  );
}

export default Header;
