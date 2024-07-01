Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [94.177.8.207])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C49C91DBEA
	for <lists+drbd-dev@lfdr.de>; Mon,  1 Jul 2024 12:00:20 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id D17B34207F4;
	Mon,  1 Jul 2024 12:00:17 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com
	[209.85.219.171])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 45C42420196
	for <drbd-dev@lists.linbit.com>; Mon,  1 Jul 2024 12:00:12 +0200 (CEST)
Received: by mail-yb1-f171.google.com with SMTP id
	3f1490d57ef6-e03424caf21so2555449276.1
	for <drbd-dev@lists.linbit.com>; Mon, 01 Jul 2024 03:00:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linbit-com.20230601.gappssmtp.com; s=20230601; t=1719828012;
	x=1720432812; darn=lists.linbit.com; 
	h=content-transfer-encoding:cc:to:subject:message-id:date:from
	:in-reply-to:references:mime-version:from:to:cc:subject:date
	:message-id:reply-to;
	bh=QQKAPHye+Y1QeLftsucSIMzy0OahLJJHVk7RRy38BV8=;
	b=ii0uaxLgtfvHCm7UdzCziEbfWDzZfR28P2k0kuEvRxzpl77Lemm1qJp1xEw+2Tbqqa
	uB0P4dvvo/s2F5mNmu3OAT8c5gpCNcf5OOqwpOoJMEMusFSTvpjY0+MF2GeLoa0sKJHP
	o2whkalH5hNISeTbGuMKJ0cIWjHHiv9qZCPQcbTbHt9McRNwHfqoFflTXDQvQraou53D
	v34BrzLEABoHMVJgp+NwxFkEyVhEJQ+ZjNv3zthLDIthiqgEUZmKKUttBwY24yE8SPk0
	viDQXSKUOaqcfl+s/IPHe/IuVsHPqPtQ+SVvYxvxlGTltfiQkh3A0v+VH+HZ5l0HWki4
	oSwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20230601; t=1719828012; x=1720432812;
	h=content-transfer-encoding:cc:to:subject:message-id:date:from
	:in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
	:subject:date:message-id:reply-to;
	bh=QQKAPHye+Y1QeLftsucSIMzy0OahLJJHVk7RRy38BV8=;
	b=MsCZZ+qoFm6dEPI1OWNI4gWKxn/4iZlEW0BteJEOE/EOZZCZGxzGWXTZ34ky9ysq9q
	zUG6MU0omLwqmzaWBt3cb4222QRMro/AymRKELk7L7HPNX+okRZaG7dcF/vw0f1UQ1ED
	XJ7MUdSSK55BvHkQIbZASmhidIendf4HMA17977VYtnuOrtlSddFx+VWrI/UGM2k/oK9
	EKbz+6GPKbbtYlmMSGWIsTtx+I6gjptCugeXkCDfDHCYEeNbpyGyxeTYTr/P2q7ZqRhO
	BDUnIRbf4YevrEvuxmf/TLsr5sMgnZxxKBq9MLum5coQJj4f5shCfVeH5Z6KzZFL7S78
	33aA==
X-Forwarded-Encrypted: i=1;
	AJvYcCXa1imeHnunh0BWtSWqeP5HJU5ATEGpzmwS5Yl6tnYeqY8XWlvqeLyzrYt+wN5Q599HEZK7wqA9zMydzJUPCbG+mmQNdky1bh8d
X-Gm-Message-State: AOJu0YzKM/58AZGjTL2rpkPKhNn44VEop7OwmAmsEVE+NnOQZyPOpq0T
	yodZRDzc5UvaVBNLDIcf7TK6fSp1PpXCmYFYlV9CL2Av0koDciJ2vMEmJKt1Rop/xNV5wBdNcBt
	YHyGDNT+t0c/1EaGEBncKJda6SRlAW+C018Ch4s18
X-Google-Smtp-Source: AGHT+IFXw6oZBd1X91vWGXiHLJY/dziFqHMUkBq4ytvcV2b3E63orQhBJfXUgqonNukweV37HlbNjSooDqSDAgwXy6o=
X-Received: by 2002:a25:ad88:0:b0:e03:25d5:8042 with SMTP id
	3f1490d57ef6-e036f292fd8mr4963111276.32.1719828011935; Mon, 01 Jul 2024
	03:00:11 -0700 (PDT)
MIME-Version: 1.0
References: <20240624054619.23212-1-zhengbing.huang@easystack.cn>
	<CADGDV=Xo6Z_K2R8vB7+7_jf0U_im0Nmy-xQ36AYh59qi45EvAQ@mail.gmail.com>
	<f0faab82-9113-d34b-fbd2-9f817c4166e0@easystack.cn>
In-Reply-To: <f0faab82-9113-d34b-fbd2-9f817c4166e0@easystack.cn>
From: Philipp Reisner <philipp.reisner@linbit.com>
Date: Mon, 1 Jul 2024 12:00:00 +0200
Message-ID: <CADGDV=Vaxg1-xfaGD4B6vogiyr1pgKDK3Rv6_bLhLC0GCgpigQ@mail.gmail.com>
Subject: Re: [PATCH 01/11] drbd_nl: dont allow detating to be inttrupted in
	waiting D_DETACHING to DISKLESS
To: Dongsheng Yang <dongsheng.yang@easystack.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Cc: drbd-dev@lists.linbit.com
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

Hi Dongsheng,

Thanks for all this information! That is already nearly a perfect
commit message.
Still, I am looking for a better approach to solving this problem.
Instead of making the detach uninterruptible, I suggest finding a way
to still schedule the ldev_destroy_work in this corner case.

PS: I prefer changes with 100 lines of commit message that touches 3
lines of code over 3 lines of commit message for 100 lines of code
changes.

best regards,
 Philipp

On Mon, Jul 1, 2024 at 4:02=E2=80=AFAM Dongsheng Yang
<dongsheng.yang@easystack.cn> wrote:
>
>
>
> =E5=9C=A8 2024/6/28 =E6=98=9F=E6=9C=9F=E4=BA=94 =E4=B8=8B=E5=8D=88 5:10, =
Philipp Reisner =E5=86=99=E9=81=93:
> > Hello Dongsheng,
> >
> > First of all, thanks for contributing patches to us.
> > Please find my reply on the patch below the quote:
> >
> > On Mon, Jun 24, 2024 at 7:52=E2=80=AFAM zhengbing.huang
> > <zhengbing.huang@easystack.cn> wrote:
> >>
> >> From: Dongsheng Yang <dongsheng.yang@easystack.cn>
> >>
> >> In our network failure and drbd down testing, we found warning in dmes=
g and drbd down process into D state:
> >>
> >> "kernel: drbd /unregistered/ramtest3/0 drbd103: ASSERTION device->disk=
_state[NOW] =3D=3D D_FAILED || device->disk_state[NOW] =3D=3D D_DETACHING F=
AILED in go_diskless"
> >>
> >> the problem is the wait_event is inttruptable, it could be intrupted b=
y signal and call drbd_cleanup_device before go_diskless()
> >>
> >
> > In this case, I suggest improving the expression in the assertion.
> > Improving an assertion can also mean removing that assertion.
>
> Hi Philipp,
>         This patchset is fixing the problems found by a network failure t=
est
> script[1].
>         The [1/11] is not about just a WARNING, it will result a process =
with D
> state in wait_event(device->misc_wait, !test_bit(GOING_DISKLESS,
> &device->flags)); in adm_del_minor().
>
> let's think about this sequence:
>
> a) drbd_adm_down -> adm_detach -> change_disk_state(device, D_DETACHING..=
.
>
> b) it will call put_ldev(), set GOING_DISKLESS and post a work for
> GO_DISKLESS
>
> c) adm_detach() start wait_event_interruptible(device->misc_wait,
>                         get_disk_state(device) !=3D D_DETACHING);
> but it can be intrrupted, then call drbd_cleanup_device() to set
> device->disk_state[NOW] =3D D_DISKLESS;
>
> after that, it will go to adm_del_minor() and
> wait_event(device->misc_wait, !test_bit(GOING_DISKLESS,
> &device->flags)); which expects drbd_ldev_destroy to clear GOING_DISKLESS=
.
>
> d) on the other hand, go_diskless work start and warn on the message in
> commit message. it will do change_disk_state(device, D_DISKLESS,
> CS_HARD, "go-diskless", NULL); But the disk_state[NOW] is already
> D_DISKLESS. So it will not schedule &device->ldev_destroy_work.
>
> As a result, the wait_event in c) will never return.
>
>
> [1]:
> check_drbd_process() {
>      ps aux | grep " D"|grep drbd
> }
>
> check_node_2_drbd_process() {
>      ssh node-2 'ps aux' | grep " D"|grep drbd
> }
>
> wait_for_no_drbd_d_state() {
>      count=3D0
>      while true; do
>          if check_drbd_process; then
>              echo "Found drbd process in D state, sleeping for ${count}
> second..."
>              sleep 1
>              count=3D$((count + 1))
>          else
>              echo "No drbd process in D state."
>              break
>          fi
>      done
>      while true; do
>          if check_node_2_drbd_process; then
>              echo "Found drbd process in D state, sleeping for ${count}
> second..."
>              sleep 1
>              count=3D$((count + 1))
>          else
>              echo "No drbd process in D state."
>              break
>          fi
>      done
> }
>
> random_sleep=3D$((RANDOM % 100))
>
> ssh node-2 "ifup Bond2-roce.1469"
> ifup Bond2-roce.1469
>
> sleep 5
>
> for i in `seq 0 9`; do
>          drbdadm up ramtest${i}
>          ssh node-2 "drbdadm up ramtest${i}"
> done
>
> sleep ${random_sleep}
>
> ssh node-2 "ifdown Bond2-roce.1469"
>
> random_sleep=3D$((RANDOM % 10))
>
> for i in `seq 0 9`; do
>          drbdsetup fail-io ramtest${i} &
>          drbdadm down ramtest${i} &
> done
>
> sleep 10
>
> wait_for_no_drbd_d_state
> >
> > The wait_event_interruptible() is there for a reason. Think of a
> > backing disk that behaves like a tar pit=E2=80=94a backing device that =
no
> > longer finishes IO requests. You want a way to interrupt the drbdsetup
> > waiting in detach.
> >
> > PS: A bit more elaborative commit messages are welcome.
> >
> > best regards,
> >   Philipp
> >
