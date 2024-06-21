/* eslint-disable react/prop-types */
import { useSearchParams } from "react-router-dom";
import { PAGE_SIZE } from "../utils/Constants";
import { Button } from "@material-tailwind/react";

function Pagination({ count }) {
  const [searhParams, setSearchParams] = useSearchParams();
  const currentPage = !searhParams.get("page")
    ? 1
    : Number(searhParams.get("page"));

  const pageCount = Math.ceil(count / PAGE_SIZE);
  function nextPage() {
    const next = currentPage === pageCount ? currentPage : currentPage + 1;
    searhParams.set("page", next);
    setSearchParams(searhParams);
  }
  function prevPage() {
    const prev = currentPage === 1 ? currentPage : currentPage - 1;
    searhParams.set("page", prev);
    setSearchParams(searhParams);
  }

  if (pageCount <= 1) return null;

  return (
    <div className="w-full flex items-center justify-between">
      <p className="text-sm ">
        Showing{" "}
        <span className="font-semibold">
          {(currentPage - 1) * PAGE_SIZE + 1}
        </span>{" "}
        to{" "}
        <span className="font-semibold">
          {currentPage === pageCount ? count : currentPage * PAGE_SIZE}
        </span>{" "}
        of <span className="font-semibold">{count}</span> data
      </p>
      <div className="flex">
        <Button
          size="sm"
          variant="text"
          onClick={prevPage}
          disabled={currentPage === 1}
          className="normal-case text-gray-700 font-semibold"
        >
          <i className="fa-solid fa-chevron-left"></i> Prev
        </Button>
        <Button
          size="sm"
          variant="text"
          onClick={nextPage}
          disabled={currentPage === pageCount}
          className="normal-case text-primary font-semibold"
        >
          Next <i className="fa-solid fa-chevron-right"></i>
        </Button>
      </div>
    </div>
  );
}

export default Pagination;
