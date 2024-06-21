/* eslint-disable react/prop-types */
import { ListItem, ListItemPrefix } from "@material-tailwind/react";
import { NavLink } from "react-router-dom";

function SidebarItem({ pathname, to, children, name }) {
  return (
    <NavLink to={to}>
      <ListItem
        className={`hover:bg-pink-primary  text-blue-gray-600 hover:text-white focus:bg-pink-primary focus:text-white bg-white ${
          pathname.includes(to) && "bg-pink-primary text-white"
        }`}
      >
        <ListItemPrefix>{children}</ListItemPrefix>
        {name}
      </ListItem>
    </NavLink>
  );
}

export default SidebarItem;
