Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id C2073CCF8B3
	for <lists+drbd-dev@lfdr.de>; Fri, 19 Dec 2025 12:13:40 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id EFC761630E9;
	Fri, 19 Dec 2025 12:13:28 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com
	[209.85.218.52])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 78E211627A9
	for <drbd-dev@lists.linbit.com>; Fri, 19 Dec 2025 12:13:25 +0100 (CET)
Received: by mail-ej1-f52.google.com with SMTP id
	a640c23a62f3a-b725ead5800so229068066b.1
	for <drbd-dev@lists.linbit.com>; Fri, 19 Dec 2025 03:13:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linbit-com.20230601.gappssmtp.com; s=20230601; t=1766142805;
	x=1766747605; darn=lists.linbit.com; 
	h=cc:to:subject:message-id:date:from:in-reply-to:references
	:mime-version:from:to:cc:subject:date:message-id:reply-to;
	bh=g7PqociWbb5Wmk+ObEvrz9yTS16TvxwCFpDoOYCNaaQ=;
	b=jShBZLxDYazRyDzKM3EMFvHXUQKhK4waBVXMsGfhPVnI2Ro1se7b2KxR1AqdETs8DQ
	4P8W1CFPXwRCyksOnvu26GXVbh8oS7k2S2VAWo4UTcympbCngWs1QhMoaQFyMu13ceXV
	DyNMIuq6wqDUkSmpM2ub9pOXKX09Szm1WHg9VTKWHFwd6M8EotWqxvzpScWMb+zRj3d0
	a0V3FTrDmyt9ku37r+G8jcbvx9Qwqb03Be/mit30rRmRjlSCU5xBjyKbP5jYfPe9q9Vn
	kUZXphvTXTNdzFkd8J+ezfnWlhtF1o2SMDvsMwY5HSk+d1+E3aB3sPEpIiwbGpqSp3Hc
	N9/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20230601; t=1766142805; x=1766747605;
	h=cc:to:subject:message-id:date:from:in-reply-to:references
	:mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
	:message-id:reply-to;
	bh=g7PqociWbb5Wmk+ObEvrz9yTS16TvxwCFpDoOYCNaaQ=;
	b=DXMKOFgqNSviEEdTHhLIVI1BNPhKzrThCO8m1FrpatNOb38vyRTpVAnU0cFGs/Shf3
	btDEiz5e/rZW8OM/kcIIy+jVDALYAbbQDWT3WODEVs96qIj/FbkL8yr9RxCLs9Rq2FGb
	+sPS56m/W+QI/IMMGiZHp1FK4Hjgx69JFh7zVGvg0W1eDV7kfnEQ0pASB4E16sD59DII
	0QVDin65a4gdV6RoyomtZkmyJIIxZXehPEbxzidtZzbEeijk+s4vnuJUPUodOWZi4GKQ
	8f++tRoSklCo9PAYdags4UIVW79VBhGuJ12iwfb/rOtYSJ+djWBlH7+0LsQhXVJEyA6f
	fQEA==
X-Gm-Message-State: AOJu0Yx0MgeK5MvrNX7Eef4P2hc+4RWct6R28ukcn5r5th12nezYzcb4
	uJdBEJb4KNbO4bPQ8bv+5gRWK5DJGzz8zoK0fu9SVER7YDLjeOVwJWVIcVBRhnVlj7YoLudCsoD
	aKssP7Efap4rPEFYLb39hNjH071OZXKkAbuf/L9iVvLp/E9nNvBmAMCq6rA==
X-Gm-Gg: AY/fxX54n6iUz0+l9R08BFPue3io9NWuXl88aA4Y8Sgy0J6lzfAAXUxbF0z7rCS5GgF
	I/2JJZy48gygjDLaO6NEezrRfGjhn4NXhsk0BSXh0AgxVRKnos72fplGDcJgF0umgMb5vHXO/Rs
	Oa0i0kV45knBQoLYRkyte4km/NJm5mkhT8Km2tw/xE3QfuAHArxQbh/fJG04zr+khEdh9Vx73hT
	vJ1m1IOkHAy+63aqSHEa0FiWLsRKYfpUK7Wt0rAjHjvluXHzTBLSJpvhjYg7cAhlGsPpjnPbzUb
	yeG8bhcnGXvAjjOnGHUHfKSvj5Y=
X-Google-Smtp-Source: AGHT+IGBoBPykXtMXMVvFuXzkv2iLKFROBkUmA9qUjmEsHj4HnhvoXaUwK8EpvkRF6ACjnSILmfVpETU7akGAdBo+tY=
X-Received: by 2002:a17:907:94cf:b0:b7d:1a23:81a0 with SMTP id
	a640c23a62f3a-b8037297276mr225512966b.63.1766142804915; Fri, 19 Dec 2025
	03:13:24 -0800 (PST)
MIME-Version: 1.0
References: <20251218130117.907395-1-zhengbing.huang@easystack.cn>
In-Reply-To: <20251218130117.907395-1-zhengbing.huang@easystack.cn>
From: Joel Colledge <joel.colledge@linbit.com>
Date: Fri, 19 Dec 2025 12:13:12 +0100
X-Gm-Features: AQt7F2rv5b5S0xBYvCRNTYMpyIj1j5BMJDSq3GzBcgi0U6PvL0kx74N2r2zW5no
Message-ID: <CAGNP_+UD+jHNEMcqk_kSSY5W85_bQe5t7Ud7WonuEeVE0Jd0Lg@mail.gmail.com>
Subject: Re: [PATCH v2] drbd: only send P_PEERS_IN_SYNC for up to 4 MiB in
	resync progress
To: "zhengbing.huang" <zhengbing.huang@easystack.cn>
Content-Type: text/plain; charset="UTF-8"
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

> The solution is to ensure that P_PEERS_IN_SYNC within a range of 4 MiB is sent each time,
> and skip the sector where there is no reysnc.

This implementation causes some P_PEERS_IN_SYNC to be sent that are
not necessary. It is still an improvement compared the current
behavior, but it would be good to solve this cleanly while we are
working on this code.

In my test I cause the following sectors to be dirty:
offset 24568 sectors (== 12MiB - 4KiB), size 8 sectors
offset 40960 sectors (== 20MiB), size 8 sectors

I expect P_PEERS_IN_SYNC with offsets:
16384 sectors (== 8MiB)
40960 sectors (== 20MiB)

I observe P_PEERS_IN_SYNC with offsets:
0 sectors
16384 sectors (== 8MiB)
24576 sectors (== 12MiB)
40960 sectors (== 20MiB)

Perhaps the code would be simpler if you handle the case of
potentially calling drbd_queue_update_peers() for the previous
last_peers_in_sync_end position as a separate case?

> +       for (; peers_in_sync_end - peer_device->last_peers_in_sync_end >= PEERS_IN_SYNC_STEP_SECT; ) {

This could be written as a while loop, but maybe it will change anyway
with the suggestion above. Perhaps we don't need a loop at all.
update_peers_for_range() already handles splitting the range up in
4MiB chunks.

Please ensure that your patches pass the checks from the Linux
upstream checkpatch.pl. Some of the lines are too long in this patch.
I know that the current code does not always pass. We are cleaning it
up as we work on it.

Joel
