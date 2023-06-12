import { SpringValue, a } from "@react-spring/web";
import { rankNames } from "../../constants";

interface ProfileInfoProps {
  username?: string;
  rank?: WefaRank;
  xp?: number;
  avatar?: string;
  avatarSpring: {
    opacity: SpringValue<number>;
    transform: SpringValue<string>;
  };
}

export const ProfileInfo: React.FC<ProfileInfoProps> = ({
  // username,
  // xp,
  rank,
  avatar,
  avatarSpring,
}) => {
  return (
    <a.div
      className="profile-avatar flex items-center w-full px-3 sm:px-6 h-full"
      style={avatarSpring}
    >
      <div className="bg-base-100 shadow-xl flex gap-3 rounded-2xl w-full">
        <div className="avatar">
          <div className=" text-neutral-content rounded-full w-20">
            <img src={avatar} alt="profile avatar" />
          </div>
        </div>
        <div className={`flex flex-col flex-1 gap-1`}>
          <div
            className={`flex text-primary items-center gap-2 justify-between w-full`}
            // style={{
            //   color: rankColors[rank ?? 0],
            // }}
          >
            <h3 className="text-xl font-bold">Rank</h3>
            <p className="text-xl font-semibold badge">
              {rankNames[rank ?? 0]}
            </p>
          </div>
        </div>
      </div>
    </a.div>
  );
};
