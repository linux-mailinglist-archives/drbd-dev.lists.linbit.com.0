Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [37.27.211.0])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C911AC63C8
	for <lists+drbd-dev@lfdr.de>; Wed, 28 May 2025 10:12:00 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 2622416B830;
	Wed, 28 May 2025 10:11:57 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
	[209.85.167.41])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 71ABA160650
	for <drbd-dev@lists.linbit.com>; Wed, 28 May 2025 10:11:51 +0200 (CEST)
Received: by mail-lf1-f41.google.com with SMTP id
	2adb3069b0e04-55324062ea8so3625749e87.3
	for <drbd-dev@lists.linbit.com>; Wed, 28 May 2025 01:11:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linbit-com.20230601.gappssmtp.com; s=20230601; t=1748419911;
	x=1749024711; darn=lists.linbit.com; 
	h=user-agent:in-reply-to:content-disposition:mime-version:references
	:message-id:subject:to:from:date:from:to:cc:subject:date:message-id
	:reply-to; bh=a745wAvXhaeSmArw4UZsAW48D/UXu72dP6H16wKOMmA=;
	b=iEt8uUAlX+RTjmGXQLKIfQJkPHYmWq1oUCkPiavl4P5QYITJbbZFCbYBzs5yCLuk1h
	ZIc6t5qeXI5RqJz90640F+ZRuCgYvBQW0X/ov54aKT5jkgjU7CX3jCzaB76CyGSLxS5I
	m4Y3vijxVRmiHXaXS5rbObea1lCLLb6gpRlDVigxGE9SGmTu2UnXym6mmgiKd+YAfbQ8
	+kS7nAnLwnV9pVJaVq/c8ksNFCaOTcburhHx0sYs5oRsQ7E2belu5TEwD/Rc2nogzPof
	DReHonu2ATgXkYxLZs2+uA9UdffZ4QL/+cR+JEW+ktgU7cB4yR+7Kcxzx5RNka/0CY2l
	Ccig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20230601; t=1748419911; x=1749024711;
	h=user-agent:in-reply-to:content-disposition:mime-version:references
	:message-id:subject:to:from:date:x-gm-message-state:from:to:cc
	:subject:date:message-id:reply-to;
	bh=a745wAvXhaeSmArw4UZsAW48D/UXu72dP6H16wKOMmA=;
	b=vovBp6gNGQuawoL2mSNLCYqRxYhEJaPqQsBOdWgjgMYWM8xQycA0g7qFqehismu3Is
	doh9iqTmb0cQFDByiw4fSEQiBF8C5cjBDg8Sqwgja77K+kE6aDkbxB/o4cRQIAMLkH82
	1/qknAZ0/OCKeqUc5B3hsaufOuY47/H6N+6bzxJo3e+QfP5uRBW8TS7stvqwShSecSwb
	1uOZVoL6I3+48kv2efX06oPKHYoxTpsgnhjG5FqUISSOJI5N7CNGGGY/lqPJz5IST0S6
	thP2YwRuLWg8n+PaJ3gEJG9VeCjQiICLZsk4Wa+Rq3jW/JVmsqo61x2V97OLk81cGmLO
	SEag==
X-Gm-Message-State: AOJu0Ywi9FS3b7o8vKdFWiCbb0Cvlz8p0BudyUlAuuCnu6asyXCWOkn1
	MFMHiU5lDGwcnNo3k3F5suxyUFg9FEKGWXLIKCj0ciYeW4tvcUBLONe4z68pKptZPB1r+uDRJfI
	sPlzOePOJDg==
X-Gm-Gg: ASbGncvB13OkKNVcc54OCwSviUviIv0iX/AlbLu4Yuf9PnX7wLP//49LXXRmRx1Ea/B
	1HuxkhqnxJTEVanRxdtA2IunF1HgyRqUJkXCy/SsT/vBJLz7ZwVkAJP1zYeHvPZgDAfoDVKeUz/
	1DDKC82cHVa2wItUMdrXj3zDayRDiojRXnFlSosRqrHe82L3941rm3tgre99tzcSRgSuPWuxIaN
	Nv4+JK8TQBVXajV/ugr6HK+YlJ88r7Ktn4rnq8d9TP/2TkNvfRaPhId8aWWoONFibhtPZ+A0Rr+
	k891qPlouDhA/pdeJDFrSksuowq3XWeI2Bt877MPqsawPxzFHWcETWnevBvtS0S+71SGGtFqYeo
	KXH8DiF1kzxi3jEtlkCRxjrZTH/kG9A==
X-Google-Smtp-Source: AGHT+IHp/2lvU8tChap1PkapM3StVpEjtBDUMiExVw5rV+RVzjM78ET140SjWdG85ttzcYxxdolMVg==
X-Received: by 2002:a05:6512:3a89:b0:553:2ed2:15b4 with SMTP id
	2adb3069b0e04-5532ed21628mr507697e87.57.1748419910857; 
	Wed, 28 May 2025 01:11:50 -0700 (PDT)
Received: from localhost (static.57.82.181.135.clients.your-server.de.
	[135.181.82.57]) by smtp.gmail.com with ESMTPSA id
	2adb3069b0e04-5532f6b5521sm169365e87.220.2025.05.28.01.11.50
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 28 May 2025 01:11:50 -0700 (PDT)
Date: Wed, 28 May 2025 10:11:49 +0200
From: Roland Kammerer <roland.kammerer@linbit.com>
To: drbd-dev@lists.linbit.com
Subject: Re: [PATCH v2 2/2] remove lock file after using it
Message-ID: <aDbFRcFQpEbhG9E1@arm64>
References: <20250515024817.25717-1-heming.zhao@suse.com>
	<20250515024817.25717-3-heming.zhao@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250515024817.25717-3-heming.zhao@suse.com>
User-Agent: Mutt/2.2.14 (2025-02-20)
X-BeenThere: drbd-dev@lists.linbit.com
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: "*Coordination* of development, patches,
	contributions -- *Questions* \(even to developers\) go to drbd-user,
	please." <drbd-dev.lists.linbit.com>
List-Unsubscribe: <https://lists.linbit.com/mailman/options/drbd-dev>,
	<mailto:drbd-dev-request@lists.linbit.com?subject=unsubscribe>
List-Archive: <http://lists.linbit.com/pipermail/drbd-dev>
List-Post: <mailto:drbd-dev@lists.linbit.com>
List-Help: <mailto:drbd-dev-request@lists.linbit.com?subject=help>
List-Subscribe: <https://lists.linbit.com/mailman/listinfo/drbd-dev>,
	<mailto:drbd-dev-request@lists.linbit.com?subject=subscribe>
Sender: drbd-dev-bounces@lists.linbit.com
Errors-To: drbd-dev-bounces@lists.linbit.com

On Thu, May 15, 2025 at 10:48:15AM +0800, Heming Zhao wrote:
> In a SELinux env, if a user runs as root to set up a DRBD device,
> it will leave a lock file in "/var/run/drbd/lock/". Then HA pacemaker
> will fail to set up DRBD because of a permission issue.

Sorry, but that needs more explanation. I wonder why it works for
everybody else including our SuSE customers but would require changes
for you? What exactly (sles versions, pacemaker versions,...) do I need
to reproduce this?

>  /* ignore errors */
> -void dt_unlock_drbd(int lock_fd)
> +void dt_unlock_drbd(int lock_fd, int minor)
>  {
> +	int ret;
> +	char *lfname;
> +
>  	if (lock_fd >= 0)
>  		unlock_fd(lock_fd);
> +
> +	lfname = get_lock_filename(minor, 0);
> +	ret = unlink(lfname);
> +	free(lfname);
> +	if (ret < 0) {
> +		perror("unlink");
> +	}
>  }

As I don't understand why you would need these changes in the first
place I did not look into the patch too closely, but: You first unlock
and then unlink? Shouldn't that be the other way round? As is you would
create a race I guess. But first things first: why do you need that at
all?

Regards, rck

P.S.: it is fine to send user land patches here, but the main focus is
on kernel level coordination, feel free to send patches via github.
