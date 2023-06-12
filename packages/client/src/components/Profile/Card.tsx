import { SpringValue, a } from "@react-spring/web";

interface ProfileCardProps {
  username?: string;
  rank?: WefaRank;
  xp?: number;
  avatar?: string;
  avatarSpring: {
    opacity: SpringValue<number>;
    transform: SpringValue<string>;
  };
}

export const ProfileCard: React.FC<ProfileCardProps> = ({
  username,
  // rank,
  // xp,
  avatar,
  avatarSpring,
}) => {
  return (
    <a.div
      className="profile-avatar flex flex-col items-center w-full px-6 sm:px-12 h-full"
      style={avatarSpring}
    >
      <div className="avatar">
        <div className=" text-neutral-content rounded-full w-24">
          <img src={avatar} alt="profile avatar" />
        </div>
      </div>
      <h2 className="text-2xl font-semibold ">{username}</h2>
    </a.div>
  );
};

export default ProfileCard;