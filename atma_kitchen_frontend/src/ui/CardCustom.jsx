import React from "react";
import {
  Card,
  CardBody,
  CardFooter,
  Typography,
  Button,
} from "@material-tailwind/react";
import { useNavigate } from "react-router-dom";

function CardCustom({ title, desc, link }) {
  const navgiate = useNavigate();
  return (
    <Card className="w-full h-full ">
      <div className="flex flex-col justify-between h-full">
        <CardBody>
          <Typography variant="h5" color="blue-gray" className="mb-2">
            {title}
          </Typography>
          <Typography>{desc}</Typography>
        </CardBody>
        <CardFooter className="pt-0 flex justify-end items-center">
          <Button
            className="bg-pink-primary"
            onClick={() => navgiate(`${link}`)}
          >
            Check Detail
          </Button>
        </CardFooter>
      </div>
    </Card>
  );
}

export default CardCustom;
