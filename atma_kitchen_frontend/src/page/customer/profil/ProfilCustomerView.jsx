import {
  Card,
  CardBody,
  Button,
  Tabs,
  TabsHeader,
  TabsBody,
  Tab,
  TabPanel,
  Switch,
  Input,
  Spinner,
} from "@material-tailwind/react";
import React, { useEffect, useState } from "react";
import { rupiah, number } from "../../../utils/rupiah";
import {
  getProfilCustomer,
  updateProfileCustomer,
} from "../../../api/ApiProfilCustomer";
import { toast } from "sonner";
import Table from "../../../ui/Table";
import { useProfilCustomer } from "./useProfilCustomer";
import { useSearchParams } from "react-router-dom";
import Pagination from "../../../ui/Pagination";
import ProfilCustomerRow from "./ProfilCustomerRow";
import { toDateInputValue } from "../../../utils/setDate";
import KonfirmasiDialog from "../../../ui/KonfirmasiDialog";
import { getAlamatCustomer } from "../../../api/ApiPemesanan";
import AlamatRow from "./AlamatRow";
function ProfilCustomerView() {
  const [activeTab, setActiveTab] = useState("biodata");
  const [switchActive, setSwitchActive] = useState(false);
  const [user, setUser] = useState({});
  const [userDefault, setUserDefault] = useState({});
  const [loading, setLoading] = useState(false);
  const [loadingPage, setLoadingPage] = useState(false);
  const [searchParams, setSearchParams] = useSearchParams();
  const { dataHistory, totalData, isLoading } = useProfilCustomer();
  const [openKonfirmasi, setOpenKonfirmasi] = useState(false);
  const [dataAlamat, setDataAlamat] = useState([]);

  const handleOpenKonfirmasi = () => setOpenKonfirmasi(!openKonfirmasi);
  const switchHandler = () => {
    setSwitchActive(!switchActive);
    if (switchActive) setUser(userDefault);
  };

  const fetchAlamat = () => {
    getAlamatCustomer()
      .then((res) => {
        setDataAlamat(res.data);
        console.log(res.data);
      })
      .catch((err) => {
        console.log(err);
      });
  };
  const fetchUser = () => {
    setLoadingPage(true);
    getProfilCustomer()
      .then((res) => {
        setUser(res);
        setUserDefault(res);
        setLoadingPage(false);
      })
      .catch((err) => {
        setLoadingPage(false);
        console.log(err.message);
      });
  };

  const handleSearch = (e) => {
    searchParams.set("search", e.target.value);
    setSearchParams(searchParams);
  };

  const handleUpdate = () => {
    if (
      user.name == "" ||
      user.username == "" ||
      user.customer.no_telp == "" ||
      user.customer.tanggal_lahir == ""
    ) {
      toast.error("Input tidak boleh kosong");
      return;
    }
    setLoading(true);
    updateProfileCustomer(user)
      .then((res) => {
        setLoading(false);
        console.log(res);
        fetchUser();
        handleOpenKonfirmasi();
        toast.success(res.message);
        localStorage.setItem("name", user.name);
        window.location.reload();
      })
      .catch((err) => {
        setLoading(false);
        console.log(err);
        toast.error(err.message);
      });
  };

  useEffect(() => {
    fetchUser();
    fetchAlamat();
  }, []);

  // Tabs Data User
  const data = [
    {
      label: "Biodata",
      value: "biodata",
      desc: (
        <>
          <div className="flex justify-between items-center">
            <p className="font-semibold text-black text-2xl">Biodata</p>
            <Switch
              label="Edit Mode"
              ripple={true}
              onClick={switchHandler}
              color="pink"
            />
          </div>
          <div className="flex gap-6 mt-4">
            <Input
              label="Username"
              disabled={!switchActive}
              value={user?.name}
              onChange={(e) => setUser({ ...user, name: e.target.value })}
            />
            <Input
              label="Email"
              disabled={!switchActive}
              value={user?.username}
              onChange={(e) => setUser({ ...user, username: e.target.value })}
            />
          </div>
          <div className="flex gap-6 mt-6">
            <Input
              label="Tanggal Lahir"
              type="date"
              disabled={!switchActive}
              value={
                user?.customer?.tanggal_lahir
                  ? toDateInputValue(user?.customer?.tanggal_lahir)
                  : ""
              }
              onChange={(e) =>
                setUser({
                  ...user,
                  customer: { ...user.customer, tanggal_lahir: e.target.value },
                })
              }
            />
            <Input
              label="Nomor Telepon"
              disabled={!switchActive}
              value={user?.customer?.no_telp}
              onChange={(e) =>
                setUser({
                  ...user,
                  customer: { ...user.customer, no_telp: e.target.value },
                })
              }
            />
          </div>
          {switchActive && (
            <div className="flex justify-end items-center mt-6">
              <Button
                className="bg-pink-primary flex- justify-center items-center"
                loading={loading}
                onClick={handleOpenKonfirmasi}
              >
                Simpan
              </Button>
            </div>
          )}
        </>
      ),
    },
    {
      label: "Alamat",
      value: "alamat",
      desc: (
        <>
          <div className="w-full">
            <h1 className="font-semibold text-black text-2xl mb-4">
              List Alamat
            </h1>
            <Table columns="grid-cols-[3fr,1fr,3.2rem]">
              <Table.Header>
                <div>Alamat</div>
                <div>Jarak</div>
                <div></div>
              </Table.Header>
              <Table.Body
                data={dataAlamat}
                isLoading={isLoading}
                render={(item) => <AlamatRow key={item.name} item={item} />}
              />
            </Table>
          </div>
        </>
      ),
    },
    {
      label: "History Pesanan",
      value: "history pesanan",
      desc: (
        <>
          <div className="w-full">
            <div className="flex w-full justify-between mb-4 items-center">
              <h1 className="font-semibold text-black text-2xl">
                History Pesanan Customer
              </h1>
              <div className="w-full md:w-72">
                <Input label="Search" type="search" onChange={handleSearch} />
              </div>
            </div>

            <Table columns="grid-cols-[2fr,2fr,2fr,2fr,2fr,3.2rem]">
              <Table.Header>
                <div>No. Nota</div>
                <div>Pengiriman</div>
                <div>Tgl Pesan</div>
                <div>Tgl Siap</div>
                <div>Status</div>
                <div></div>
              </Table.Header>
              <Table.Body
                data={dataHistory}
                isLoading={isLoading}
                render={(item) => (
                  <ProfilCustomerRow key={item.name} item={item} />
                )}
              />
              <Table.Footer>
                <Pagination count={totalData} />
              </Table.Footer>
            </Table>
          </div>
        </>
      ),
    },
  ];
  // End of Tabs Data User
  return (
    <>
      {loadingPage ? (
        <div className="h-svh flex justify-center items-center">
          <Spinner color="red" className="h-20 w-20 -mt-52 text-pink-primary" />
        </div>
      ) : (
        <div className={`grid grid-cols-3 gap-4 h-svh`}>
          <div className="">
            <Card className="w-full mb-6">
              <CardBody>
                <div className="flex item-start gap-4">
                  <div className="w-28 h-28 rounded-lg">
                    <img
                      src="https://images.unsplash.com/photo-1544005313-94ddf0286df2?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1288&q=80"
                      alt=""
                      className="w-full h-full bg-top rounded-lg border-2 border-pink-primary object-cover"
                    />
                  </div>
                  <div>
                    <p className="text-lg text-black font-semibold mb-2">
                      {userDefault?.name}
                    </p>
                    <p className="text-base flex gap-2 items-center mb-2">
                      <span className="w-[40px]">Saldo</span>:{" "}
                      <span className="text-black font-semibold">
                        {rupiah(userDefault?.customer?.saldo)}
                      </span>
                    </p>
                    <p className="text-base flex gap-2 items-center">
                      <span className="w-[40px]">Poin</span>:{" "}
                      <span className="text-black font-semibold">
                        {number(userDefault?.customer?.poin)}
                      </span>
                    </p>
                  </div>
                </div>
              </CardBody>
            </Card>
          </div>
          <div className="col-span-2">
            <Card className="w-full mb-6">
              <CardBody className="pb-2">
                <Tabs value={activeTab}>
                  <TabsHeader
                    className="rounded-none border-b border-blue-gray-50 bg-transparent p-0"
                    indicatorProps={{
                      className:
                        "bg-transparent border-b-2 border-gray-900 shadow-none rounded-none",
                    }}
                  >
                    {data.map(({ label, value }) => (
                      <Tab
                        key={value}
                        value={value}
                        onClick={() => setActiveTab(value)}
                        className={activeTab === value ? "text-gray-900" : ""}
                      >
                        {label}
                      </Tab>
                    ))}
                  </TabsHeader>
                  <TabsBody>
                    {data.map(({ value, desc }) => (
                      <TabPanel key={value} value={value}>
                        {desc}
                      </TabPanel>
                    ))}
                  </TabsBody>
                </Tabs>
              </CardBody>
            </Card>
          </div>
        </div>
      )}

      <KonfirmasiDialog
        handleOpenKonfirmasi={handleOpenKonfirmasi}
        openKonfirmasi={openKonfirmasi}
        isProcessing={isLoading}
        handleAdd={handleUpdate}
      />
    </>
  );
}

export default ProfilCustomerView;
