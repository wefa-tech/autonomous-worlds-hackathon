interface ProfileSettingsProps {}

// TODO: Stylize Bleyle

export const ProfileSettings: React.FC<ProfileSettingsProps> = () => {
  // TODO: add color mode toggle

  return (
    <section className="flex flex-col gap-3 items-center py-12">
      <div className="form-control w-full max-w-xs">
        <label className="label">
          <span className="label-text">Set Color Mode</span>
          <span className="label-text-alt">Alt label</span>
        </label>
        <select className="select select-bordered">
          <option disabled selected>
            Pick one
          </option>
          <option>Light</option>
          <option>Dark</option>
        </select>
        <label className="label">
          <span className="label-text-alt">Alt label</span>
          <span className="label-text-alt">Alt label</span>
        </label>
      </div>
      <div className="form-control w-52">
        <label className="cursor-pointer label">
          <span className="label-text">Remember me</span>
          <input type="checkbox" className="toggle toggle-primary" checked />
        </label>
      </div>
    </section>
  );
};