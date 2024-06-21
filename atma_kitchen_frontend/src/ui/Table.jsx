/* eslint-disable react/prop-types */
import { createContext, useContext } from "react";
import { Spinner } from "@material-tailwind/react";

const TableContext = createContext();

function Table({ columns, children }) {
  return (
    <TableContext.Provider value={{ columns }}>
      <div className="border-slate-200 border-[1px]  text-base rounded-xl bg-white w-full text-blue-gray-700  overflow-x-auto">
        {children}
      </div>
    </TableContext.Provider>
  );
}

function Header({ children }) {
  const { columns } = useContext(TableContext);
  return (
    <section
      className={`grid ${columns} bg-pink-secondary gap-4 items-center  border-b-2 border-gray-100 py-[1rem] px-6 font-semibold uppercase`}
    >
      {children}
    </section>
  );
}

function Row({ children }) {
  const { columns } = useContext(TableContext);
  return (
    <div
      className={`grid ${columns} gap-4 items-center py-3 px-6 border-b-[1px] border-slate-100`}
    >
      {children}
    </div>
  );
}

function Body({ data, render, isLoading }) {
  if (isLoading) {
    return (
      <div className="flex justify-center items-center my-10">
        <Spinner color="red" className="h-16 w-16 text-pink-primary" />
      </div>
    );
  }
  if (data?.length === 0)
    return (
      <div className="flex justify-center items-center my-10">
        <p className="text-lg text-gray-500">No Data</p>
      </div>
    );
  return <section>{data.map(render)}</section>;
}

function Footer({ children }) {
  if (!children) return null;
  return (
    <footer className="flex justify-center items-center p-5 py-2  bg-slate-50">
      {children}
    </footer>
  );
}

Table.Header = Header;
Table.Row = Row;
Table.Body = Body;
Table.Footer = Footer;

export default Table;
